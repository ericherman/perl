#!/usr/bin/env perl
use v5.36;
use utf8;
use open IN => ":encoding(UTF-8)";
use Test2::V0;

( undef, my @tests ) = split /^%/m, do { local $/; <DATA> };

@tests = @tests[@ARGV] if @ARGV;

for my $test (@tests) {
    my ( $cmd, $expected ) = split /\n/, $test, 2;
    is( qx($cmd 2>/dev/null), $expected, $cmd );
}

done_testing;

__DATA__
% ./Porting/updateAUTHORS.pl --from=v5.43.9 --to=v5.43.10 --who
Christian Hansen, Craig A. Berry, Daniel Tang, Dmitrii Kuvaiskii, E. Choroba,
Eric Herman, James Cook, James E Keenan, Karen Etheridge, Karl Williamson, Leon
Timmermans, Lukas Mai, Nicolas R, Paul Evans, Philippe Bruhat (BooK), Richard
Leach, Robert Rothenberg, Shirakata Kentaro, Steve Hay, Thibault Duponchelle,
Tony Cook.
% perl Porting/updateAUTHORS.pl --who --from=v5.43.6 --to=v5.43.7
Bartosz Jarzyna, Dan Church, David Mitchell, Graham Knop, James E Keenan, Karl
Williamson, Lukas Mai, Max Maischein, Paul Evans, Samuel Young, Steve Hay,
TAKAI Kousuke, Thibault Duponchelle, Tony Cook.
% perl Porting/updateAUTHORS.pl --who v5.43.6..v5.43.7
Bartosz Jarzyna, Dan Church, David Mitchell, Graham Knop, James E Keenan, Karl
Williamson, Lukas Mai, Max Maischein, Paul Evans, Samuel Young, Steve Hay,
TAKAI Kousuke, Thibault Duponchelle, Tony Cook.
% perl Porting/updateAUTHORS.pl --rank --percentage --from=v5.43.6
#Pos | %Authored | Name                    
#----+-----------+-------------------------
#1   |     39.41 | Karl Williamson         
#2   |     13.62 | David Mitchell          
#3   |      6.16 | Paul Evans              
#4   |      5.84 | Richard Leach           
#5   |      5.08 | Lukas Mai               
#6   |      4.81 | Tony Cook               
#7   |      4.22 | Yves Orton              
#8   |      2.70 | Leon Timmermans         
#9   |      2.00 | Philippe Bruhat (BooK)  
#10  |      1.95 | James E Keenan          
#11  |      1.95 | Steve Hay               
#12  |      1.30 | Graham Knop             
#13  |      1.24 | Karen Etheridge         
#14  |      1.03 | Craig A. Berry          
#15  |      0.70 | Paul Marquess           
#16  |      0.59 | Eric Herman             
#17  |      0.59 | Max Maischein           
#18  |      0.54 | Scott Baker             
#19  |      0.49 | Bartosz Jarzyna         
#20  |      0.49 | TAKAI Kousuke           
#21  |      0.43 | Sevan Janiyan           
#22  |      0.38 | Aristotle Pagaltzis     
#23  |      0.32 | Robert Rothenberg       
#24  |      0.27 | H.Merijn Brand          
#25  |      0.22 | Branislav Zahradník     
#26  |      0.22 | Chris 'BinGOs' Williams 
#27  |      0.22 | Dagfinn Ilmari Mannsåker
#28  |      0.22 | Dmitrii Kuvaiskii       
#29  |      0.16 | Chad Granum             
#30  |      0.16 | Harald Jörg             
#31  |      0.16 | Olaf Alders             
#32  |      0.16 | Ricardo Signes          
#33  |      0.16 | Shirakata Kentaro       
#34  |      0.16 | Thibault Duponchelle    
#35  |      0.11 | Alin Iacob              
#36  |      0.11 | Daniel Tang             
#37  |      0.11 | Dina Tagantseva         
#38  |      0.11 | E. Choroba              
#39  |      0.11 | James Cook              
#40  |      0.11 | Russ Allbery            
#41  |      0.11 | theoremoon              
#42  |      0.11 | Tomasz Konojacki        
#43  |      0.05 | Andreas König           
#44  |      0.05 | Andrew Hewus Fresh      
#45  |      0.05 | Arne Johannessen        
#46  |      0.05 | Brad Smith              
#47  |      0.05 | Christian Hansen        
#48  |      0.05 | Dan Church              
#49  |      0.05 | Dan Kogai               
#50  |      0.05 | Ed J                    
#51  |      0.05 | Georgij Tsarin          
#52  |      0.05 | James Raspass           
#53  |      0.05 | Jan Dubois              
#54  |      0.05 | Marc Reisner            
#55  |      0.05 | Nick Johnston           
#56  |      0.05 | Nicolas R               
#57  |      0.05 | Samuel Young            
#58  |      0.05 | Shlomi Fish             
#59  |      0.05 | Sisyphus                
#60  |      0.05 | Stan Ulbrych            
#61  |      0.05 | Stefan Adams            
#62  |      0.05 | Toby Inkster            
#63  |      0.05 | Unicode Consortium      
#64  |      0.05 | Yudai Takada            
% perl Porting/updateAUTHORS.pl --thanks-applied --from=v5.43.6
#Pos | Applied | Name                  
#----+---------+-----------------------
#1   |     115 | Paul Evans            
#2   |      56 | James E Keenan        
#3   |      34 | Karl Williamson       
#4   |      26 | Leon Timmermans       
#5   |      15 | Tony Cook             
#6   |      12 | Aristotle Pagaltzis   
#7   |       9 | Yves Orton            
#8   |       6 | Lukas Mai             
#9   |       5 | Philippe Bruhat (BooK)
#10  |       4 | Richard Leach         
#11  |       4 | Tomasz Konojacki      
#12  |       3 | Eric Herman           
#13  |       1 | Max Maischein         
% perl Porting/updateAUTHORS.pl --tap --from=v5.43.6 --to=v5.43.7
ok 1 - Is authors_file 'AUTHORS' up to date?
ok 2 - Is mailmap_file '.mailmap' up to date?
ok 3 - Is exclude_file 'Porting/exclude_contrib.txt' up to date?
ok 4 - No dupes in AUTHORS
ok 5 - git knows your author name and email.
ok 6 - git knows your committer name and email.
ok 7 - Uncommitted changes are by a known contributor?
1..7
% perl Porting/updateAUTHORS.pl --files --from=v5.43.6 --to=v5.43.7
#Pos | commits | L++ | L-- |  L+- | binary_change | Name                                    
#----+---------+-----+-----+------+---------------+-----------------------------------------
#1   |      24 | 120 | 104 |   16 |             0 | embed.fnc                               
#2   |      17 |  57 |  55 |    2 |             0 | regen/embed.pl                          
#3   |      16 |  43 |  48 |   -5 |             0 | proto.h                                 
#4   |      11 | 125 | 203 |  -78 |             0 | numeric.c                               
#5   |       8 | 385 | 377 |    8 |             0 | toke.c                                  
#6   |       8 |  21 |   7 |   14 |             0 | embed.h                                 
#7   |       6 | 343 | 461 | -118 |             0 | pod/perldelta.pod                       
#8   |       5 | 153 |  66 |   87 |             0 | locale.c                                
#9   |       5 |  65 |  12 |   53 |             0 | ext/B/B.xs                              
#10  |       4 | 203 |   1 |  202 |             0 | inline.h                                
#11  |       4 |  24 |   4 |   20 |             0 | regexec.c                               
#12  |       4 |  12 |   4 |    8 |             0 | handy.h                                 
#13  |       3 | 135 |  16 |  119 |             0 | ext/POSIX/t/time.t                      
#14  |       3 |  41 |   5 |   36 |             0 | dist/Module-CoreList/lib/Module/CoreList.pm
#15  |       3 |  21 |  49 |  -28 |             0 | perl.h                                  
#16  |       3 |   4 |   2 |    2 |             0 | pod/perlguts.pod                        
#17  |       3 |   3 |   0 |    3 |             0 | MANIFEST                                
#18  |       2 |  56 |   0 |   56 |             0 | ext/B/t/b_uni.t                         
#19  |       2 |  41 |  49 |   -8 |             0 | pod/perlapio.pod                        
#20  |       2 |   9 |   2 |    7 |             0 | dist/Module-CoreList/lib/Module/CoreList/Utils.pm
#21  |       2 |   8 |   4 |    4 |             0 | dist/ExtUtils-ParseXS/lib/ExtUtils/ParseXS/Node.pm
#22  |       2 |   4 |   1 |    3 |             0 | dist/Module-CoreList/Changes            
#23  |       2 |   3 |   3 |    0 |             0 | Porting/Maintainers.pl                  
#24  |       2 |   3 |   3 |    0 |             0 | win32/GNUmakefile                       
#25  |       2 |   3 |   3 |    0 |             0 | win32/Makefile                          
#26  |       2 |   3 |   2 |    1 |             0 | pod/perlop.pod                          
#27  |       2 |   2 |   1 |    1 |             0 | regen.pl                                
#28  |       1 | 268 |   0 |  268 |             0 | pod/perl5436delta.pod                   
#29  |       1 | 125 |  60 |   65 |             0 | pod/perldata.pod                        
#30  |       1 |  95 |   0 |   95 |             0 | ext/B/t/optree_signatures.t             
#31  |       1 |  68 |  13 |   55 |             0 | cpan/HTTP-Tiny/lib/HTTP/Tiny.pm         
#32  |       1 |  36 |   1 |   35 |             0 | t/op/hexfp.t                            
#33  |       1 |  28 |   1 |   27 |             0 | t/op/decl-refs.t                        
#34  |       1 |  26 |   9 |   17 |             0 | cpan/HTTP-Tiny/t/160_cookies.t          
#35  |       1 |  24 |   0 |   24 |             0 | dist/ExtUtils-ParseXS/t/001-basic.t     
#36  |       1 |  21 |  21 |    0 |             0 | Porting/config.sh                       
#37  |       1 |  20 |  20 |    0 |             0 | Cross/config.sh-arm-linux               
#38  |       1 |  20 |  20 |    0 |             0 | Cross/config.sh-arm-linux-n770          
#39  |       1 |  19 |  19 |    0 |             0 | plan9/config_sh.sample                  
#40  |       1 |  19 |   2 |   17 |             0 | pp_ctl.c                                
#41  |       1 |  15 |   0 |   15 |             0 | t/op/for-many.t                         
#42  |       1 |  14 |  14 |    0 |             0 | INSTALL                                 
#43  |       1 |  13 |   1 |   12 |             0 | t/op/array.t                            
#44  |       1 |  11 |   0 |   11 |             0 | cpan/HTTP-Tiny/t/170_keepalive.t        
#45  |       1 |   9 |   9 |    0 |             0 | Porting/config_H                        
#46  |       1 |   9 |   1 |    8 |             0 | ext/B/t/concise.t                       
#47  |       1 |   8 |   0 |    8 |             0 | Porting/epigraphs.pod                   
#48  |       1 |   6 |  38 |  -32 |             0 | ext/POSIX/lib/POSIX.pod                 
#49  |       1 |   6 |   4 |    2 |             0 | autodoc.pl                              
#50  |       1 |   6 |   1 |    5 |             0 | cpan/HTTP-Tiny/t/190_find_CA.t          
#51  |       1 |   6 |   1 |    5 |             0 | ext/POSIX/t/posix.t                     
#52  |       1 |   5 |   0 |    5 |             0 | t/lib/feature/implicit                  
#53  |       1 |   4 |   4 |    0 |             0 | intrpvar.h                              
#54  |       1 |   4 |   4 |    0 |             0 | Makefile.SH                             
#55  |       1 |   4 |   4 |    0 |             0 | README.macosx                           
#56  |       1 |   4 |   2 |    2 |             0 | ext/Pod-Html/lib/Pod/Html/Util.pm       
#57  |       1 |   4 |   0 |    4 |             0 | win32/pod.mak                           
#58  |       1 |   3 |   3 |    0 |             0 | l1_char_class_tab.h                     
#59  |       1 |   2 |   4 |   -2 |             0 | ext/POSIX/POSIX.xs                      
#60  |       1 |   2 |   2 |    0 |             0 | embedvar.h                              
#61  |       1 |   2 |   2 |    0 |             0 | ext/B/B/Concise.pm                      
#62  |       1 |   2 |   2 |    0 |             0 | hints/catamount.sh                      
#63  |       1 |   2 |   2 |    0 |             0 | patchlevel.h                            
#64  |       1 |   2 |   2 |    0 |             0 | pod/perlclib.pod                        
#65  |       1 |   2 |   2 |    0 |             0 | pp_pack.c                               
#66  |       1 |   2 |   2 |    0 |             0 | README.haiku                            
#67  |       1 |   2 |   2 |    0 |             0 | README.vms                              
#68  |       1 |   2 |   1 |    1 |             0 | installhtml                             
#69  |       1 |   2 |   1 |    1 |             0 | pod/perlhacktips.pod                    
#70  |       1 |   1 |   1 |    0 |             0 | av.c                                    
#71  |       1 |   1 |   1 |    0 |             0 | charclass_invlists.inc                  
#72  |       1 |   1 |   1 |    0 |             0 | dist/ExtUtils-ParseXS/lib/ExtUtils/ParseXS/Constants.pm
#73  |       1 |   1 |   1 |    0 |             0 | dist/ExtUtils-ParseXS/lib/ExtUtils/ParseXS/CountLines.pm
#74  |       1 |   1 |   1 |    0 |             0 | dist/ExtUtils-ParseXS/lib/ExtUtils/ParseXS/Eval.pm
#75  |       1 |   1 |   1 |    0 |             0 | dist/ExtUtils-ParseXS/lib/ExtUtils/ParseXS.pm
#76  |       1 |   1 |   1 |    0 |             0 | dist/ExtUtils-ParseXS/lib/ExtUtils/ParseXS/Utilities.pm
#77  |       1 |   1 |   1 |    0 |             0 | dist/ExtUtils-ParseXS/lib/ExtUtils/Typemaps/Cmd.pm
#78  |       1 |   1 |   1 |    0 |             0 | dist/ExtUtils-ParseXS/lib/ExtUtils/Typemaps/InputMap.pm
#79  |       1 |   1 |   1 |    0 |             0 | dist/ExtUtils-ParseXS/lib/ExtUtils/Typemaps/OutputMap.pm
#80  |       1 |   1 |   1 |    0 |             0 | dist/ExtUtils-ParseXS/lib/ExtUtils/Typemaps.pm
#81  |       1 |   1 |   1 |    0 |             0 | dist/ExtUtils-ParseXS/lib/ExtUtils/Typemaps/Type.pm
#82  |       1 |   1 |   1 |    0 |             0 | dist/ExtUtils-ParseXS/lib/perlxs.pod    
#83  |       1 |   1 |   1 |    0 |             0 | ext/B/B.pm                              
#84  |       1 |   1 |   1 |    0 |             0 | ext/Pod-Html/lib/Pod/Html.pm            
#85  |       1 |   1 |   1 |    0 |             0 | ext/Pod-Html/t/lib/Testing.pm           
#86  |       1 |   1 |   1 |    0 |             0 | ext/POSIX/lib/POSIX.pm                  
#87  |       1 |   1 |   1 |    0 |             0 | lib/B/Op_private.pm                     
#88  |       1 |   1 |   1 |    0 |             0 | lib/unicore/uni_keywords.pl             
#89  |       1 |   1 |   1 |    0 |             0 | META.json                               
#90  |       1 |   1 |   1 |    0 |             0 | META.yml                                
#91  |       1 |   1 |   1 |    0 |             0 | pod/.gitignore                          
#92  |       1 |   1 |   1 |    0 |             0 | pod/perldiag.pod                        
#93  |       1 |   1 |   1 |    0 |             0 | pod/perlfunc.pod                        
#94  |       1 |   1 |   1 |    0 |             0 | pod/perlreapi.pod                       
#95  |       1 |   1 |   1 |    0 |             0 | Porting/perldelta_template.pod          
#96  |       1 |   1 |   1 |    0 |             0 | Porting/release_schedule.pod            
#97  |       1 |   1 |   1 |    0 |             0 | Porting/sync-with-cpan                  
#98  |       1 |   1 |   1 |    0 |             0 | Porting/todo.pod                        
#99  |       1 |   1 |   1 |    0 |             0 | README.os2                              
#100 |       1 |   1 |   1 |    0 |             0 | regcomp.c                               
#101 |       1 |   1 |   1 |    0 |             0 | regexp_constants.h                      
#102 |       1 |   1 |   1 |    0 |             0 | uni_keywords.h                          
#103 |       1 |   1 |   1 |    0 |             0 | vms/descrip_mms.template                
#104 |       1 |   1 |   0 |    1 |             0 | pod/perlhist.pod                        
#105 |       1 |   1 |   0 |    1 |             0 | pod/perl.pod                            
#106 |       1 |   1 |   0 |    1 |             0 | regen/mk_PL_charclass.pl                
#107 |       1 |   0 |  16 |  -16 |             0 | utf8.c                                  
#108 |       1 |   0 |   3 |   -3 |             0 | pp.c                                    
% perl Porting/updateAUTHORS.pl --activity --from=v5.43.6 --to=v5.43.7
#Pos |  L+- | L++ | L-- | commits | Name                                    
#----+------+-----+-----+---------+-----------------------------------------
#1   |  268 | 268 |   0 |       1 | pod/perl5436delta.pod                   
#2   |  202 | 203 |   1 |       4 | inline.h                                
#3   |  119 | 135 |  16 |       3 | ext/POSIX/t/time.t                      
#4   |   95 |  95 |   0 |       1 | ext/B/t/optree_signatures.t             
#5   |   87 | 153 |  66 |       5 | locale.c                                
#6   |   65 | 125 |  60 |       1 | pod/perldata.pod                        
#7   |   56 |  56 |   0 |       2 | ext/B/t/b_uni.t                         
#8   |   55 |  68 |  13 |       1 | cpan/HTTP-Tiny/lib/HTTP/Tiny.pm         
#9   |   53 |  65 |  12 |       5 | ext/B/B.xs                              
#10  |   36 |  41 |   5 |       3 | dist/Module-CoreList/lib/Module/CoreList.pm
#11  |   35 |  36 |   1 |       1 | t/op/hexfp.t                            
#12  |   27 |  28 |   1 |       1 | t/op/decl-refs.t                        
#13  |   24 |  24 |   0 |       1 | dist/ExtUtils-ParseXS/t/001-basic.t     
#14  |   20 |  24 |   4 |       4 | regexec.c                               
#15  |   17 |  26 |   9 |       1 | cpan/HTTP-Tiny/t/160_cookies.t          
#16  |   17 |  19 |   2 |       1 | pp_ctl.c                                
#17  |   16 | 120 | 104 |      24 | embed.fnc                               
#18  |   15 |  15 |   0 |       1 | t/op/for-many.t                         
#19  |   14 |  21 |   7 |       8 | embed.h                                 
#20  |   12 |  13 |   1 |       1 | t/op/array.t                            
#21  |   11 |  11 |   0 |       1 | cpan/HTTP-Tiny/t/170_keepalive.t        
#22  |    8 | 385 | 377 |       8 | toke.c                                  
#23  |    8 |  12 |   4 |       4 | handy.h                                 
#24  |    8 |   9 |   1 |       1 | ext/B/t/concise.t                       
#25  |    8 |   8 |   0 |       1 | Porting/epigraphs.pod                   
#26  |    7 |   9 |   2 |       2 | dist/Module-CoreList/lib/Module/CoreList/Utils.pm
#27  |    5 |   6 |   1 |       1 | cpan/HTTP-Tiny/t/190_find_CA.t          
#28  |    5 |   6 |   1 |       1 | ext/POSIX/t/posix.t                     
#29  |    5 |   5 |   0 |       1 | t/lib/feature/implicit                  
#30  |    4 |   8 |   4 |       2 | dist/ExtUtils-ParseXS/lib/ExtUtils/ParseXS/Node.pm
#31  |    4 |   4 |   0 |       1 | win32/pod.mak                           
#32  |    3 |   4 |   1 |       2 | dist/Module-CoreList/Changes            
#33  |    3 |   3 |   0 |       3 | MANIFEST                                
#34  |    2 |  57 |  55 |      17 | regen/embed.pl                          
#35  |    2 |   6 |   4 |       1 | autodoc.pl                              
#36  |    2 |   4 |   2 |       3 | pod/perlguts.pod                        
#37  |    2 |   4 |   2 |       1 | ext/Pod-Html/lib/Pod/Html/Util.pm       
#38  |    1 |   3 |   2 |       2 | pod/perlop.pod                          
#39  |    1 |   2 |   1 |       2 | regen.pl                                
#40  |    1 |   2 |   1 |       1 | installhtml                             
#41  |    1 |   2 |   1 |       1 | pod/perlhacktips.pod                    
#42  |    1 |   1 |   0 |       1 | pod/perlhist.pod                        
#43  |    1 |   1 |   0 |       1 | pod/perl.pod                            
#44  |    1 |   1 |   0 |       1 | regen/mk_PL_charclass.pl                
#45  |   -2 |   2 |   4 |       1 | ext/POSIX/POSIX.xs                      
#46  |   -3 |   0 |   3 |       1 | pp.c                                    
#47  |   -5 |  43 |  48 |      16 | proto.h                                 
#48  |   -8 |  41 |  49 |       2 | pod/perlapio.pod                        
#49  |  -16 |   0 |  16 |       1 | utf8.c                                  
#50  |  -28 |  21 |  49 |       3 | perl.h                                  
#51  |  -32 |   6 |  38 |       1 | ext/POSIX/lib/POSIX.pod                 
#52  |  -78 | 125 | 203 |      11 | numeric.c                               
#53  | -118 | 343 | 461 |       6 | pod/perldelta.pod                       
% perl Porting/updateAUTHORS.pl --chainsaw v5.43.6..v5.43.7
#Pos |  L+- | L++ | L-- | commits | Name                                    
#----+------+-----+-----+---------+-----------------------------------------
#1   | -118 | 343 | 461 |       6 | pod/perldelta.pod                       
#2   |  -78 | 125 | 203 |      11 | numeric.c                               
#3   |  -32 |   6 |  38 |       1 | ext/POSIX/lib/POSIX.pod                 
#4   |  -28 |  21 |  49 |       3 | perl.h                                  
#5   |  -16 |   0 |  16 |       1 | utf8.c                                  
#6   |   -8 |  41 |  49 |       2 | pod/perlapio.pod                        
#7   |   -5 |  43 |  48 |      16 | proto.h                                 
#8   |   -3 |   0 |   3 |       1 | pp.c                                    
#9   |   -2 |   2 |   4 |       1 | ext/POSIX/POSIX.xs                      
#10  |    1 |   1 |   0 |       1 | regen/mk_PL_charclass.pl                
#11  |    1 |   1 |   0 |       1 | pod/perl.pod                            
#12  |    1 |   1 |   0 |       1 | pod/perlhist.pod                        
#13  |    1 |   2 |   1 |       1 | pod/perlhacktips.pod                    
#14  |    1 |   2 |   1 |       1 | installhtml                             
#15  |    1 |   2 |   1 |       2 | regen.pl                                
#16  |    1 |   3 |   2 |       2 | pod/perlop.pod                          
#17  |    2 |   4 |   2 |       1 | ext/Pod-Html/lib/Pod/Html/Util.pm       
#18  |    2 |   4 |   2 |       3 | pod/perlguts.pod                        
#19  |    2 |   6 |   4 |       1 | autodoc.pl                              
#20  |    2 |  57 |  55 |      17 | regen/embed.pl                          
#21  |    3 |   3 |   0 |       3 | MANIFEST                                
#22  |    3 |   4 |   1 |       2 | dist/Module-CoreList/Changes            
#23  |    4 |   4 |   0 |       1 | win32/pod.mak                           
#24  |    4 |   8 |   4 |       2 | dist/ExtUtils-ParseXS/lib/ExtUtils/ParseXS/Node.pm
#25  |    5 |   5 |   0 |       1 | t/lib/feature/implicit                  
#26  |    5 |   6 |   1 |       1 | ext/POSIX/t/posix.t                     
#27  |    5 |   6 |   1 |       1 | cpan/HTTP-Tiny/t/190_find_CA.t          
#28  |    7 |   9 |   2 |       2 | dist/Module-CoreList/lib/Module/CoreList/Utils.pm
#29  |    8 |   8 |   0 |       1 | Porting/epigraphs.pod                   
#30  |    8 |   9 |   1 |       1 | ext/B/t/concise.t                       
#31  |    8 |  12 |   4 |       4 | handy.h                                 
#32  |    8 | 385 | 377 |       8 | toke.c                                  
#33  |   11 |  11 |   0 |       1 | cpan/HTTP-Tiny/t/170_keepalive.t        
#34  |   12 |  13 |   1 |       1 | t/op/array.t                            
#35  |   14 |  21 |   7 |       8 | embed.h                                 
#36  |   15 |  15 |   0 |       1 | t/op/for-many.t                         
#37  |   16 | 120 | 104 |      24 | embed.fnc                               
#38  |   17 |  19 |   2 |       1 | pp_ctl.c                                
#39  |   17 |  26 |   9 |       1 | cpan/HTTP-Tiny/t/160_cookies.t          
#40  |   20 |  24 |   4 |       4 | regexec.c                               
#41  |   24 |  24 |   0 |       1 | dist/ExtUtils-ParseXS/t/001-basic.t     
#42  |   27 |  28 |   1 |       1 | t/op/decl-refs.t                        
#43  |   35 |  36 |   1 |       1 | t/op/hexfp.t                            
#44  |   36 |  41 |   5 |       3 | dist/Module-CoreList/lib/Module/CoreList.pm
#45  |   53 |  65 |  12 |       5 | ext/B/B.xs                              
#46  |   55 |  68 |  13 |       1 | cpan/HTTP-Tiny/lib/HTTP/Tiny.pm         
#47  |   56 |  56 |   0 |       2 | ext/B/t/b_uni.t                         
#48  |   65 | 125 |  60 |       1 | pod/perldata.pod                        
#49  |   87 | 153 |  66 |       5 | locale.c                                
#50  |   95 |  95 |   0 |       1 | ext/B/t/optree_signatures.t             
#51  |  119 | 135 |  16 |       3 | ext/POSIX/t/time.t                      
#52  |  202 | 203 |   1 |       4 | inline.h                                
#53  |  268 | 268 |   0 |       1 | pod/perl5436delta.pod                   
% echo perl Porting/updateAUTHORS.pl --change-name "Old Name"="New Name"
perl Porting/updateAUTHORS.pl --change-name Old Name=New Name
% echo perl Porting/updateAUTHORS.pl --change-name-for-email "x@y.com"="Name"
perl Porting/updateAUTHORS.pl --change-name-for-email x@y.com=Name
% echo perl Porting/updateAUTHORS.pl --change-email-for-name "Name"="p@q.com"
perl Porting/updateAUTHORS.pl --change-email-for-name Name=p@q.com
