use File::Find;
use Cwd;

$cwd = getcwd();
sub process
{
    unless (-d)
    {
        #print "$cwd/$File::Find::name:\n";
        $output = `grep "$ARGV[1]" \"$cwd/$File::Find::name\"`;
        #$output = `grep $ARGV[1] \"$File::Find::name\"`;
        if ($output ne '')
        {
            print "$File::Find::name:\n";
            print $output."\n";
        }
    }
}

find(\&process,("$ARGV[0]"));
