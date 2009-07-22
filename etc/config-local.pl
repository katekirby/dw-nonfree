#!/usr/bin/perl
# -*-perl-*-

# LiveJournal configuration file.  Copy this out of the documentation
# directory to etc/config-local.pl and edit as necessary.  The reason
# it's not in the etc directory already is to protect it from
# getting clobbered when you upgrade to the newest LiveJournal code in
# the future.

# This should be the only file you need to change to get the
# LiveJournal code to run on your site. Use the checkconfig.pl
# utility to find any other config variables that might not
# be documented here. You should be able to set config values
# here and have the LJ code run; if you have to modify the
# code itself, it's a bug and you should report it.

{
    package LJ;

    # keep this enabled only if this site is a development server
    $IS_DEV_SERVER = 1;
    $ENABLE_BETA_TOOLS = 1;

    # home directory
    $HOME = $ENV{'LJHOME'};

    # the base domain of your site.
    # CHANGE THIS
    $DOMAIN = $DW::PRIVATE::DOMAIN;

    # human readable name of this site as well as shortened versions
    # CHANGE THIS
    $SITENAME = "Dreamwidth Studios";
    $SITENAMESHORT = "Dreamwidth";
    $SITENAMEABBREV = "DW";
    $SITECOMPANY = "Dreamwidth Studios, LLC";

    # MemCache information, if you have MemCache servers running
    @MEMCACHE_SERVERS = ('127.0.0.1:11211');
    #$MEMCACHE_COMPRESS_THRESHOLD = 1_000; # bytes

    # optional SMTP server if it is to be used instead of sendmail
    $SMTP_SERVER = "localhost";
    $MAIL_TO_THESCHWARTZ = 1;

    # database info.  only the master is necessary.
    # you should probably CHANGE THIS
    %DBINFO = (
               'master' => {  # master must be named 'master'
                   'host' => "localhost",
                   'port' => 3306,
                   'user' => 'dw',
                   'pass' => $DW::PRIVATE::DBINFO{master}->{pass},
                   'dbname' => 'dw',
                   'role' => {
                       'cluster1' => 1,
                       'slow' => 1,

                       # optionally, apache write its access logs to a mysql database
                       #logs => 1,
                   },
               },
               # example of a TCP-based DB connection
               #'somehostname' => {
               #    'host' => "somehost",
               #    'port' => 1234,
               #    'user' => 'username',
               #    'pass' => 'password',
               #},
               # example of a UNIX domain-socket DB connection
               #'otherhost' => {
               #    'sock' => "$HOME/var/mysqld.sock",
               #    'user' => 'username',
               #    'pass' => 'password',
               #},
    );

    # Schwartz DB configuration
    @THESCHWARTZ_DBS = (
            {
                dsn => 'dbi:mysql:dw_schwartz;host=localhost',
                user => 'dw',
                pass => $DW::PRIVATE::THESCHWARTZ_DBS{pass},
            },
        );

    # setup recaptcha
    %RECAPTCHA = (
            public_key  => $DW::PRIVATE::RECAPTCHA{public_key},
            private_key => $DW::PRIVATE::RECAPTCHA{private_key},
        );

    # PayPal configuration
    %PAYPAL_CONFIG = (
            # express checkout URL, the token gets appended to this
            url       => 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=',
            api_url   => 'https://api-3t.sandbox.paypal.com/nvp',

            # credentials for the API
            user      => $DW::PRIVATE::PAYPAL{user},
            password  => $DW::PRIVATE::PAYPAL{password},
            signature => $DW::PRIVATE::PAYPAL{signature},

            # set this to someone who is responsible for getting emails about
            # various PayPal related events
            email     => $DW::PRIVATE::PAYPAL{email},
        );

    # if you define these, little help bubbles appear next to common
    # widgets to the URL you define:
    %HELPURL = (
        paidaccountinfo => "http://www.dreamwidth.org/support/faqbrowse.bml?faqid=4",
    );

    # 404 page
    $PAGE_404 = "404-error-local.bml";
 
    # shop/pricing configuration
    %SHOP = (
        # key => [ $USD, months, account type ],
        prem6  => [  20,  6, 'premium' ],
        prem12 => [  40, 12, 'premium' ],
        paid1  => [   3,  1, 'paid'    ],
        paid2  => [   5,  2, 'paid'    ],
        paid6  => [  13,  6, 'paid'    ],
        paid12 => [  25, 12, 'paid'    ],
        seed   => [ 200, 99, 'seed'    ],
    );

}

1;
