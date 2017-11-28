#!/usr/bin/env perl

=encoding utf-8
=head1 NAME

dotfiles.pl - Script for handle user conf files.

=head1 SYNOPSIS

 perl dotfiles.pl

=cut

use 5.10.0;
use strict;
use warnings;
use Getopt::Long;
use Pod::Usage qw(pod2usage);
use File::Spec;
use File::Copy;
use File::Basename;
use FindBin;
use POSIX qw(strftime);

my %options;

$options{'conf_home'} = File::Spec->catfile( $FindBin::Bin, '..', 'home' );
$options{'user_home'} = $ENV{"HOME"};
$options{'timestamp'} = strftime "%Y%m%d%H%M%S", localtime;

GetOptions(
    "h|?|help"   => \$options{'help'},
    "c|copy"     => \$options{'copy'},
    "n|nobackup" => \$options{'nobackup'},
    "a|all"      => \$options{'all'},
    "u|userhome" => \$options{'user_home'},
    "i|confhome" => \$options{'conf_home'}
) or exit 1;

pod2usage( -exitval => 0 ) if $options{'help'};

run();

#-------------------------------------------------------------------------------

sub run {
    my $conf_files = read_conf_dir();

    foreach my $file ( @{$conf_files} ) {
        my $source = File::Spec->catfile( $options{'conf_home'}, $file );
        my $target = File::Spec->catfile( $options{'user_home'}, $file );
        ask_user( $source, $target );
    }
}

sub read_conf_dir {
    my ( $fh, @conf_files );

    opendir( $fh, $options{'conf_home'} ) or die $!;
    while ( my $file = readdir($fh) ) {
        next if ( $file =~ m/^\.\.?$/ );
        push @conf_files, $file;
    }
    close $fh;
    return \@conf_files;
}

sub get_type {
    my $file = shift;
    my $type;

    if ( -e $file and -f $file ) {
        $type = 'file';
    }
    elsif ( -e $file and -d $file ) {
        $type = 'directory';
    }
    elsif ( -e $file and -l $file ) {
        $type = 'link';
    }
    else {
        $type = 'unknown';
    }

    return $type;
}

sub ask_user {
    my ( $source, $target ) = ( shift, shift );
    my ( $question, $answer, $action );

    my $source_type = get_type($source);
    my $target_type = get_type($target);

    if ( $options{'copy'} ) {
        $question .= "Copy";
        $action = \&action_copy;
    }
    else {
        $question .= "Symlink";
        $action = \&action_symlink;
    }
    $question .= " $source_type '$source' to '$target'";
    $question .= ' [Yes|No|All|Cancel]: ';

    if ( not $options{'all'} ) {
        print $question;
        do {
            $answer = lc(<STDIN>);
            chomp $answer;
            print "type: 'Y', 'N', 'A' or 'C': "
              if ( $answer !~ /^[ynac]$/ );
        } while ( $answer !~ /^[ynac]$/ );

        exit(0) if ( $answer eq 'c' );
        $options{'all'} = 1 if ( $answer eq 'a' );
        return if ( $answer eq 'n' );
    }

    if ( $options{'all'} or $answer eq 'y' ) {
        my $target_backup = $target . '_backup' . $options{'timestamp'};
        if ( not $options{'nobackup'} and $target_type ne 'unknown' ) {
            move( $target, $target_backup )
              or die "Can not move '$target' to '$target_backup'";
        }
        &$action( $source, $target );
    }
}

sub action_copy {
    my ( $source, $target ) = ( shift, shift );
    copy( $source, $target ) or die "Can not copy '$source' to '$target'";
}

sub action_symlink {
    my ( $source, $target ) = ( shift, shift );
    symlink( $source, $target ) or die "Can not symlink '$source' to '$target'";
}

__END__
=head1 OPTIONS

=over 4

=item B<-h, -?, --help>

Prints this help message and exits.

=item B<-c, --copy>

Copy files insted of symlink creation.

=item B<-n, --nobackup>

Do not make backup of replaced files and dirs.

=item B<-a, --all>

Batch mode.

=item B<-u, --userhome>

User home dir (default $ENV{HOME})

=back

=cut

