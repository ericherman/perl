#!/usr/bin/env perl
use v5.36;
use utf8;
use open IN => ":encoding(UTF-8)";
use Test2::V0;

( undef, my @tests ) = split /^%/m, do { local $/; <DATA> };

@tests = @tests[@ARGV] if @ARGV;

for my $test (@tests) {
    my ( $cmd, $expected ) = split /\n/, $test, 2;
    my $got = `$cmd`;
    is( $? >> 8, 0, "$cmd (command succeeded)" );
    is( $got, $expected, $cmd );
}

done_testing;

__DATA__
% perl Porting/updateAUTHORS.pl v5.43.6..v5.43.7  --who
Bartosz Jarzyna, Dan Church, David Mitchell, Graham Knop, James E Keenan, Karl
Williamson, Lukas Mai, Max Maischein, Paul Evans, Samuel Young, Steve Hay,
TAKAI Kousuke, Thibault Duponchelle, Tony Cook.
% perl Porting/updateAUTHORS.pl v5.43.9..v5.43.10 --who
Christian Hansen, Craig A. Berry, Daniel Tang, Dmitrii Kuvaiskii, E. Choroba,
Eric Herman, James Cook, James E Keenan, Karen Etheridge, Karl Williamson, Leon
Timmermans, Lukas Mai, Nicolas R, Paul Evans, Philippe Bruhat (BooK), Richard
Leach, Robert Rothenberg, Shirakata Kentaro, Steve Hay, Thibault Duponchelle,
Tony Cook.
% perl Porting/updateAUTHORS.pl --from=v5.43.6 --to=v5.43.10 --who
Bartosz Jarzyna, Chris 'BinGOs' Williams, Christian Hansen, Craig A. Berry,
Dagfinn Ilmari Mannsåker, Dan Church, Daniel Tang, David Mitchell, Dmitrii
Kuvaiskii, E. Choroba, Ed J, Eric Herman, Graham Knop, Harald Jörg, H.Merijn
Brand, James Cook, James E Keenan, James Raspass, Karen Etheridge, Karl
Williamson, Leon Timmermans, Lukas Mai, Max Maischein, Nicolas R, Olaf Alders,
Paul Evans, Paul Marquess, Philippe Bruhat (BooK), Ricardo Signes, Richard
Leach, Robert Rothenberg, Samuel Young, Scott Baker, Sevan Janiyan, Shirakata
Kentaro, Steve Hay, TAKAI Kousuke, Thibault Duponchelle, Toby Inkster, Tomasz
Konojacki, Tony Cook.
% perl Porting/updateAUTHORS.pl --from=v5.43.6 --to=v5.43.7  --rank --percentage
#Pos | %Authored | Name                
#----+-----------+---------------------
#1   |     70.83 | Karl Williamson     
#2   |      5.83 | Tony Cook           
#3   |      4.17 | Paul Evans          
#4   |      4.17 | Steve Hay           
#5   |      3.33 | David Mitchell      
#6   |      3.33 | Max Maischein       
#7   |      1.67 | Bartosz Jarzyna     
#8   |      1.67 | Lukas Mai           
#9   |      0.83 | Dan Church          
#10  |      0.83 | Graham Knop         
#11  |      0.83 | James E Keenan      
#12  |      0.83 | Samuel Young        
#13  |      0.83 | TAKAI Kousuke       
#14  |      0.83 | Thibault Duponchelle
% perl Porting/updateAUTHORS.pl --from=v5.43.9 --to=v5.43.10 --rank --percentage
#Pos | %Authored | Name                  
#----+-----------+-----------------------
#1   |     55.61 | Karl Williamson       
#2   |      6.63 | Philippe Bruhat (BooK)
#3   |      5.10 | Eric Herman           
#4   |      4.59 | Richard Leach         
#5   |      4.59 | Tony Cook             
#6   |      4.08 | Steve Hay             
#7   |      3.06 | Lukas Mai             
#8   |      2.55 | James E Keenan        
#9   |      2.04 | Craig A. Berry        
#10  |      2.04 | Dmitrii Kuvaiskii     
#11  |      1.53 | Karen Etheridge       
#12  |      1.53 | Leon Timmermans       
#13  |      1.53 | Paul Evans            
#14  |      1.02 | E. Choroba            
#15  |      1.02 | James Cook            
#16  |      0.51 | Christian Hansen      
#17  |      0.51 | Daniel Tang           
#18  |      0.51 | Nicolas R             
#19  |      0.51 | Robert Rothenberg     
#20  |      0.51 | Shirakata Kentaro     
#21  |      0.51 | Thibault Duponchelle  
% perl Porting/updateAUTHORS.pl --from=v5.43.6 --to=v5.43.7  --thanks-applied
#Pos | Applied | Name           
#----+---------+----------------
#1   |       4 | Karl Williamson
#2   |       3 | James E Keenan 
% perl Porting/updateAUTHORS.pl --from=v5.43.9 --to=v5.43.10 --thanks-applied
#Pos | Applied | Name                  
#----+---------+-----------------------
#1   |       8 | Tony Cook             
#2   |       7 | Karl Williamson       
#3   |       4 | James E Keenan        
#4   |       2 | Philippe Bruhat (BooK)
#5   |       1 | Leon Timmermans       
#6   |       1 | Paul Evans            
% perl Porting/updateAUTHORS.pl --from=v5.43.6 --to=v5.43.7  --files
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
% perl Porting/updateAUTHORS.pl --from=v5.43.9 --to=v5.43.10 --files
#Pos | commits |  L++ |  L-- |  L+- | binary_change | Name                                    
#----+---------+------+------+------+---------------+-----------------------------------------
#1   |      19 |  204 |  383 | -179 |             0 | toke.c                                  
#2   |      16 |  125 |  114 |   11 |             0 | embed.fnc                               
#3   |      12 |  123 |   83 |   40 |             0 | regen/embed.pl                          
#4   |      12 |   99 |   81 |   18 |             0 | op.c                                    
#5   |      11 | 6692 | 6077 |  615 |             0 | proto.h                                 
#6   |      11 |   38 |   52 |  -14 |             0 | sv.c                                    
#7   |      11 |   20 |   26 |   -6 |             0 | util.c                                  
#8   |      10 |   19 |  146 | -127 |             0 | embed.h                                 
#9   |       7 |   98 |   64 |   34 |             0 | pp_ctl.c                                
#10  |       7 |   38 |   35 |    3 |             0 | gv.c                                    
#11  |       7 |   12 |   10 |    2 |             0 | Porting/Maintainers.pl                  
#12  |       6 |  159 |  155 |    4 |             0 | regexec.c                               
#13  |       6 |   70 |   68 |    2 |             0 | regcomp.c                               
#14  |       6 |   25 |   21 |    4 |             0 | perl.c                                  
#15  |       5 |  372 |  468 |  -96 |             0 | pod/perldelta.pod                       
#16  |       5 |  156 |  153 |    3 |             0 | MANIFEST                                
#17  |       5 |   92 |    3 |   89 |             0 | dist/Module-CoreList/lib/Module/CoreList.pm
#18  |       5 |   40 |   29 |   11 |             0 | regcomp_study.c                         
#19  |       5 |   37 |   34 |    3 |             0 | pod/perlvar.pod                         
#20  |       4 |  182 |   31 |  151 |             0 | pod/perlhack.pod                        
#21  |       4 |  100 |   47 |   53 |             0 | Porting/release_managers_guide.pod      
#22  |       4 |   78 |   75 |    3 |             0 | regcomp_debug.c                         
#23  |       4 |   69 |   21 |   48 |             0 | pod/perlre.pod                          
#24  |       4 |   62 |   60 |    2 |             0 | regcomp_trie.c                          
#25  |       4 |    9 |    3 |    6 |             0 | pod/perlfunc.pod                        
#26  |       4 |    7 |    5 |    2 |             0 | Porting/release_schedule.pod            
#27  |       4 |    6 |    3 |    3 |             0 | Porting/core-team.json                  
#28  |       4 |    5 |    5 |    0 |             0 | pp_hot.c                                
#29  |       4 |    4 |    1 |    3 |             0 | AUTHORS                                 
#30  |       3 |  283 |  277 |    6 |             0 | dump.c                                  
#31  |       3 |  208 |   20 |  188 |             0 | long_names.c                            
#32  |       3 |   67 |   20 |   47 |             0 | pod/perlhacktips.pod                    
#33  |       3 |   57 |    0 |   57 |             0 | Porting/epigraphs.pod                   
#34  |       3 |   45 |   13 |   32 |             0 | class.c                                 
#35  |       3 |   24 |    1 |   23 |             0 | autodoc.pl                              
#36  |       3 |   22 |    9 |   13 |             0 | pod/perlsyn.pod                         
#37  |       3 |   22 |    1 |   21 |             0 | dist/Module-CoreList/lib/Module/CoreList/Utils.pm
#38  |       3 |   20 |    2 |   18 |             0 | handy.h                                 
#39  |       3 |   19 |    3 |   16 |             0 | perl.h                                  
#40  |       3 |   13 |    7 |    6 |             0 | regcomp.h                               
#41  |       3 |   12 |   12 |    0 |             0 | pp_sys.c                                
#42  |       3 |   10 |    6 |    4 |             0 | pod/perl.pod                            
#43  |       3 |    5 |    0 |    5 |             0 | pod/perlhist.pod                        
#44  |       3 |    4 |    4 |    0 |             0 | perlio.c                                
#45  |       3 |    3 |    3 |    0 |             0 | META.json                               
#46  |       2 |  552 |  552 |    0 |             0 | cpan/JSON-PP/lib/JSON/PP.pm             
#47  |       2 |   44 |   11 |   33 |             0 | pod/perlrebackslash.pod                 
#48  |       2 |   24 |   10 |   14 |             0 | invlist_inline.h                        
#49  |       2 |   22 |   21 |    1 |             0 | mro_core.c                              
#50  |       2 |   17 |    2 |   15 |             0 | util.h                                  
#51  |       2 |   16 |   16 |    0 |             0 | cpan/JSON-PP/t/121_reentrant.t          
#52  |       2 |   12 |    5 |    7 |             0 | ext/POSIX/t/time.t                      
#53  |       2 |   12 |    0 |   12 |             0 | win32/pod.mak                           
#54  |       2 |   11 |   12 |   -1 |             0 | utf8.c                                  
#55  |       2 |   10 |    7 |    3 |             0 | hv.c                                    
#56  |       2 |    9 |    0 |    9 |             0 | dist/Module-CoreList/Changes            
#57  |       2 |    8 |    6 |    2 |             0 | pod/perldeprecation.pod                 
#58  |       2 |    5 |    4 |    1 |             0 | Configure                               
#59  |       2 |    3 |    3 |    0 |             0 | pod/perlguts.pod                        
#60  |       2 |    3 |    3 |    0 |             0 | scope.c                                 
#61  |       2 |    3 |    3 |    0 |             0 | win32/GNUmakefile                       
#62  |       2 |    3 |    3 |    0 |             0 | win32/Makefile                          
#63  |       2 |    2 |    2 |    0 |             0 | cpan/JSON-PP/bin/json_pp                
#64  |       2 |    2 |    2 |    0 |             0 | cpan/JSON-PP/lib/JSON/PP/Boolean.pm     
#65  |       2 |    2 |    2 |    0 |             0 | pod/perlop.pod                          
#66  |       2 |    2 |    2 |    0 |             0 | pp.c                                    
#67  |       1 |  261 |    0 |  261 |             0 | pod/perl5439delta.pod                   
#68  |       1 |  175 |  175 |    0 |             0 | regcharclass.h                          
#69  |       1 |  127 |    0 |  127 |             0 | pod/perl5404delta.pod                   
#70  |       1 |  126 |    0 |  126 |             0 | pod/perl5422delta.pod                   
#71  |       1 |   75 |   75 |    0 |             0 | pod/perlvms.pod                         
#72  |       1 |   72 |    0 |   72 |             0 | cpan/Module-Metadata/t/extract-version.t
#73  |       1 |   61 |   61 |    0 |             0 | pod/perldebtut.pod                      
#74  |       1 |   56 |   56 |    0 |             0 | pod/perlpacktut.pod                     
#75  |       1 |   54 |   54 |    0 |             0 | pod/perlebcdic.pod                      
#76  |       1 |   48 |   14 |   34 |             0 | cpan/Pod-Simple/t/xhtml25.t             
#77  |       1 |   47 |   47 |    0 |             0 | pod/perlmodstyle.pod                    
#78  |       1 |   45 |    0 |   45 |             0 | Porting/bisect-runner.pl                
#79  |       1 |   37 |   37 |    0 |             0 | pod/perl5140delta.pod                   
#80  |       1 |   36 |    1 |   35 |             0 | t/op/lexsub.t                           
#81  |       1 |   23 |    0 |   23 |             0 | t/class/inherit.t                       
#82  |       1 |   22 |   22 |    0 |             0 | pod/perl561delta.pod                    
#83  |       1 |   22 |    8 |   14 |             0 | cpan/Pod-Simple/lib/Pod/Simple/XHTML.pm 
#84  |       1 |   22 |    4 |   18 |             0 | cpan/Pod-Simple/t/xhtml01.t             
#85  |       1 |   21 |   21 |    0 |             0 | Porting/config.sh                       
#86  |       1 |   20 |   20 |    0 |             0 | Cross/config.sh-arm-linux               
#87  |       1 |   20 |   20 |    0 |             0 | Cross/config.sh-arm-linux-n770          
#88  |       1 |   20 |   20 |    0 |             0 | pod/perl56delta.pod                     
#89  |       1 |   19 |   19 |    0 |             0 | plan9/config_sh.sample                  
#90  |       1 |   19 |   19 |    0 |             0 | pod/perldebguts.pod                     
#91  |       1 |   19 |   19 |    0 |             0 | pod/perltie.pod                         
#92  |       1 |   18 |   19 |   -1 |             0 | cop.h                                   
#93  |       1 |   18 |   18 |    0 |             0 | pod/perl589delta.pod                    
#94  |       1 |   18 |   18 |    0 |             0 | pod/perldiag.pod                        
#95  |       1 |   18 |    0 |   18 |             0 | lib/builtin.t                           
#96  |       1 |   17 |   17 |    0 |             0 | pod/perlform.pod                        
#97  |       1 |   17 |    5 |   12 |             0 | cpan/Module-Metadata/lib/Module/Metadata.pm
#98  |       1 |   15 |   15 |    0 |             0 | pod/perl5121delta.pod                   
#99  |       1 |   15 |   15 |    0 |             0 | pod/perldata.pod                        
#100 |       1 |   14 |   14 |    0 |             0 | INSTALL                                 
#101 |       1 |   10 |   10 |    0 |             0 | lib/B/Deparse.t                         
#102 |       1 |    9 |    9 |    0 |             0 | Porting/config_H                        
#103 |       1 |    9 |    2 |    7 |             0 | regen/regcharclass.pl                   
#104 |       1 |    9 |    0 |    9 |             0 | t/re/pat_advanced.t                     
#105 |       1 |    8 |    8 |    0 |             0 | pod/perl5141delta.pod                   
#106 |       1 |    8 |    8 |    0 |             0 | pod/perlpodspec.pod                     
#107 |       1 |    8 |    0 |    8 |             0 | cpan/Module-Metadata/t/extract-package.t
#108 |       1 |    8 |    0 |    8 |             0 | hv.h                                    
#109 |       1 |    7 |   16 |   -9 |             0 | pod/perlclib.pod                        
#110 |       1 |    7 |    7 |    0 |             0 | pod/perl5005delta.pod                   
#111 |       1 |    7 |    7 |    0 |             0 | pod/perl5160delta.pod                   
#112 |       1 |    7 |    1 |    6 |             0 | pod/perlgov.pod                         
#113 |       1 |    6 |    6 |    0 |             0 | av.c                                    
#114 |       1 |    6 |    6 |    0 |             0 | mg.c                                    
#115 |       1 |    6 |    5 |    1 |             0 | .mailmap                                
#116 |       1 |    5 |    5 |    0 |             0 | cpan/Pod-Simple/t/fcodes_s.t            
#117 |       1 |    5 |    5 |    0 |             0 | pod/perldebug.pod                       
#118 |       1 |    5 |    5 |    0 |             0 | pod/perldocstyle.pod                    
#119 |       1 |    5 |    1 |    4 |             0 | dist/ExtUtils-ParseXS/Changes           
#120 |       1 |    5 |    0 |    5 |             0 | Porting/make-rmg-checklist              
#121 |       1 |    4 |    4 |    0 |             0 | inline.h                                
#122 |       1 |    4 |    4 |    0 |             0 | Makefile.SH                             
#123 |       1 |    4 |    4 |    0 |             0 | pad.c                                   
#124 |       1 |    4 |    4 |    0 |             0 | pod/perlpod.pod                         
#125 |       1 |    4 |    4 |    0 |             0 | pod/perlsecpolicy.pod                   
#126 |       1 |    4 |    4 |    0 |             0 | README.macosx                           
#127 |       1 |    4 |    4 |    0 |             0 | regcomp_invlist.c                       
#128 |       1 |    4 |    3 |    1 |             0 | cpan/Pod-Simple/lib/Pod/Simple/HTMLBatch.pm
#129 |       1 |    4 |    1 |    3 |             0 | t/op/sub.t                              
#130 |       1 |    4 |    0 |    4 |             0 | dist/Exporter/Changes                   
#131 |       1 |    4 |    0 |    4 |             0 | win32/win32.h                           
#132 |       1 |    3 |    3 |    0 |             0 | builtin.c                               
#133 |       1 |    3 |    3 |    0 |             0 | doop.c                                  
#134 |       1 |    3 |    3 |    0 |             0 | ext/B/B/Concise.pm                      
#135 |       1 |    3 |    3 |    0 |             0 | pod/perl5100delta.pod                   
#136 |       1 |    3 |    3 |    0 |             0 | pod/perl5101delta.pod                   
#137 |       1 |    3 |    3 |    0 |             0 | pod/perl5320delta.pod                   
#138 |       1 |    3 |    3 |    0 |             0 | pod/perlutil.pod                        
#139 |       1 |    3 |    3 |    0 |             0 | t/lib/feature/implicit                  
#140 |       1 |    3 |    3 |    0 |             0 | universal.c                             
#141 |       1 |    3 |    2 |    1 |             0 | cpan/Pod-Simple/lib/Pod/Simple/HTML.pm  
#142 |       1 |    3 |    0 |    3 |             0 | t/loc_tools.pl                          
#143 |       1 |    2 |    3 |   -1 |             0 | vutil.c                                 
#144 |       1 |    2 |    2 |    0 |             0 | hints/catamount.sh                      
#145 |       1 |    2 |    2 |    0 |             0 | patchlevel.h                            
#146 |       1 |    2 |    2 |    0 |             0 | pod/perl5004delta.pod                   
#147 |       1 |    2 |    2 |    0 |             0 | pod/perl5280delta.pod                   
#148 |       1 |    2 |    2 |    0 |             0 | pod/perl5300delta.pod                   
#149 |       1 |    2 |    2 |    0 |             0 | pod/perlnewmod.pod                      
#150 |       1 |    2 |    2 |    0 |             0 | pod/perlsec.pod                         
#151 |       1 |    2 |    2 |    0 |             0 | pod/perlunitut.pod                      
#152 |       1 |    2 |    2 |    0 |             0 | README.haiku                            
#153 |       1 |    2 |    2 |    0 |             0 | README.vms                              
#154 |       1 |    2 |    2 |    0 |             0 | t/lib/warnings/op                       
#155 |       1 |    2 |    1 |    1 |             0 | ext/File-Glob/Glob.pm                   
#156 |       1 |    2 |    1 |    1 |             0 | regen/opcodes                           
#157 |       1 |    2 |    0 |    2 |             0 | Porting/release_announcement_template.txt
#158 |       1 |    1 |    9 |   -8 |             0 | t/re/pat_rt_report.t                    
#159 |       1 |    1 |    2 |   -1 |             0 | cpan/version/lib/version.pm             
#160 |       1 |    1 |    2 |   -1 |             0 | pp_pack.c                               
#161 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/BlackBox.pm
#162 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/Checker.pm
#163 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/Debug.pm 
#164 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/DumpAsText.pm
#165 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/DumpAsXML.pm
#166 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/LinkSection.pm
#167 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/Methody.pm
#168 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple.pm       
#169 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/Progress.pm
#170 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/PullParserEndToken.pm
#171 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/PullParser.pm
#172 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/PullParserStartToken.pm
#173 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/PullParserTextToken.pm
#174 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/PullParserToken.pm
#175 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/RTF.pm   
#176 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/Search.pm
#177 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/SimpleTree.pm
#178 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/TextContent.pm
#179 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/Text.pm  
#180 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/TiedOutFH.pm
#181 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/TranscodeDumb.pm
#182 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/Transcode.pm
#183 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/TranscodeSmart.pm
#184 |       1 |    1 |    1 |    0 |             0 | cpan/Pod-Simple/lib/Pod/Simple/XMLOutStream.pm
#185 |       1 |    1 |    1 |    0 |             0 | cpan/version/lib/version/regex.pm       
#186 |       1 |    1 |    1 |    0 |             0 | cpan/version/t/01base.t                 
#187 |       1 |    1 |    1 |    0 |             0 | cpan/version/t/02derived.t              
#188 |       1 |    1 |    1 |    0 |             0 | cpan/version/t/03require.t              
#189 |       1 |    1 |    1 |    0 |             0 | cpan/version/t/05sigdie.t               
#190 |       1 |    1 |    1 |    0 |             0 | cpan/version/t/06noop.t                 
#191 |       1 |    1 |    1 |    0 |             0 | cpan/version/t/07locale.t               
#192 |       1 |    1 |    1 |    0 |             0 | cpan/version/t/08_corelist.t            
#193 |       1 |    1 |    1 |    0 |             0 | cpan/version/t/09_list_util.t           
#194 |       1 |    1 |    1 |    0 |             0 | cpan/version/t/coretests.pm             
#195 |       1 |    1 |    1 |    0 |             0 | deb.c                                   
#196 |       1 |    1 |    1 |    0 |             0 | lib/B/Op_private.pm                     
#197 |       1 |    1 |    1 |    0 |             0 | META.yml                                
#198 |       1 |    1 |    1 |    0 |             0 | numeric.c                               
#199 |       1 |    1 |    1 |    0 |             0 | os390/os390.c                           
#200 |       1 |    1 |    1 |    0 |             0 | pod/.gitignore                          
#201 |       1 |    1 |    1 |    0 |             0 | pod/perl5120delta.pod                   
#202 |       1 |    1 |    1 |    0 |             0 | pod/perl5125delta.pod                   
#203 |       1 |    1 |    1 |    0 |             0 | pod/perl5200delta.pod                   
#204 |       1 |    1 |    1 |    0 |             0 | pod/perl5201delta.pod                   
#205 |       1 |    1 |    1 |    0 |             0 | pod/perl5260delta.pod                   
#206 |       1 |    1 |    1 |    0 |             0 | pod/perl5341delta.pod                   
#207 |       1 |    1 |    1 |    0 |             0 | pod/perl5362delta.pod                   
#208 |       1 |    1 |    1 |    0 |             0 | pod/perl5363delta.pod                   
#209 |       1 |    1 |    1 |    0 |             0 | pod/perl5380delta.pod                   
#210 |       1 |    1 |    1 |    0 |             0 | pod/perl5381delta.pod                   
#211 |       1 |    1 |    1 |    0 |             0 | pod/perl5382delta.pod                   
#212 |       1 |    1 |    1 |    0 |             0 | pod/perl5433delta.pod                   
#213 |       1 |    1 |    1 |    0 |             0 | pod/perl581delta.pod                    
#214 |       1 |    1 |    1 |    0 |             0 | pod/perl582delta.pod                    
#215 |       1 |    1 |    1 |    0 |             0 | pod/perl583delta.pod                    
#216 |       1 |    1 |    1 |    0 |             0 | pod/perl585delta.pod                    
#217 |       1 |    1 |    1 |    0 |             0 | pod/perl587delta.pod                    
#218 |       1 |    1 |    1 |    0 |             0 | pod/perl588delta.pod                    
#219 |       1 |    1 |    1 |    0 |             0 | pod/perlapio.pod                        
#220 |       1 |    1 |    1 |    0 |             0 | pod/perlcall.pod                        
#221 |       1 |    1 |    1 |    0 |             0 | pod/perldbmfilter.pod                   
#222 |       1 |    1 |    1 |    0 |             0 | pod/perlinterp.pod                      
#223 |       1 |    1 |    1 |    0 |             0 | pod/perliol.pod                         
#224 |       1 |    1 |    1 |    0 |             0 | pod/perllocale.pod                      
#225 |       1 |    1 |    1 |    0 |             0 | pod/perlmod.pod                         
#226 |       1 |    1 |    1 |    0 |             0 | pod/perlmroapi.pod                      
#227 |       1 |    1 |    1 |    0 |             0 | pod/perlobj.pod                         
#228 |       1 |    1 |    1 |    0 |             0 | pod/perlreref.pod                       
#229 |       1 |    1 |    1 |    0 |             0 | pod/perlunicode.pod                     
#230 |       1 |    1 |    1 |    0 |             0 | pod/perlunifaq.pod                      
#231 |       1 |    1 |    1 |    0 |             0 | Porting/perldelta_template.pod          
#232 |       1 |    1 |    1 |    0 |             0 | Porting/sync-with-cpan                  
#233 |       1 |    1 |    1 |    0 |             0 | Porting/todo.pod                        
#234 |       1 |    1 |    1 |    0 |             0 | pp_sort.c                               
#235 |       1 |    1 |    1 |    0 |             0 | README.os2                              
#236 |       1 |    1 |    1 |    0 |             0 | regcomp_internal.h                      
#237 |       1 |    1 |    1 |    0 |             0 | regen/HeaderParser.pm                   
#238 |       1 |    1 |    1 |    0 |             0 | sv_inline.h                             
#239 |       1 |    1 |    1 |    0 |             0 | t/lib/warnings/pp_ctl                   
#240 |       1 |    1 |    1 |    0 |             0 | t/porting/customized.dat                
#241 |       1 |    1 |    1 |    0 |             0 | t/run/locale.t                          
#242 |       1 |    1 |    1 |    0 |             0 | vms/descrip_mms.template                
#243 |       1 |    1 |    1 |    0 |             0 | vms/vms.c                               
#244 |       1 |    1 |    0 |    1 |             0 | t/porting/known_pod_issues.dat          
% perl Porting/updateAUTHORS.pl --from=v5.43.6 --to=v5.43.7  --activity
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
% perl Porting/updateAUTHORS.pl --from=v5.43.9 --to=v5.43.10 --activity
#Pos |  L+- |  L++ |  L-- | commits | Name                                    
#----+------+------+------+---------+-----------------------------------------
#1   |  615 | 6692 | 6077 |      11 | proto.h                                 
#2   |  261 |  261 |    0 |       1 | pod/perl5439delta.pod                   
#3   |  188 |  208 |   20 |       3 | long_names.c                            
#4   |  151 |  182 |   31 |       4 | pod/perlhack.pod                        
#5   |  127 |  127 |    0 |       1 | pod/perl5404delta.pod                   
#6   |  126 |  126 |    0 |       1 | pod/perl5422delta.pod                   
#7   |   89 |   92 |    3 |       5 | dist/Module-CoreList/lib/Module/CoreList.pm
#8   |   72 |   72 |    0 |       1 | cpan/Module-Metadata/t/extract-version.t
#9   |   57 |   57 |    0 |       3 | Porting/epigraphs.pod                   
#10  |   53 |  100 |   47 |       4 | Porting/release_managers_guide.pod      
#11  |   48 |   69 |   21 |       4 | pod/perlre.pod                          
#12  |   47 |   67 |   20 |       3 | pod/perlhacktips.pod                    
#13  |   45 |   45 |    0 |       1 | Porting/bisect-runner.pl                
#14  |   40 |  123 |   83 |      12 | regen/embed.pl                          
#15  |   35 |   36 |    1 |       1 | t/op/lexsub.t                           
#16  |   34 |   98 |   64 |       7 | pp_ctl.c                                
#17  |   34 |   48 |   14 |       1 | cpan/Pod-Simple/t/xhtml25.t             
#18  |   33 |   44 |   11 |       2 | pod/perlrebackslash.pod                 
#19  |   32 |   45 |   13 |       3 | class.c                                 
#20  |   23 |   24 |    1 |       3 | autodoc.pl                              
#21  |   23 |   23 |    0 |       1 | t/class/inherit.t                       
#22  |   21 |   22 |    1 |       3 | dist/Module-CoreList/lib/Module/CoreList/Utils.pm
#23  |   18 |   99 |   81 |      12 | op.c                                    
#24  |   18 |   22 |    4 |       1 | cpan/Pod-Simple/t/xhtml01.t             
#25  |   18 |   20 |    2 |       3 | handy.h                                 
#26  |   18 |   18 |    0 |       1 | lib/builtin.t                           
#27  |   16 |   19 |    3 |       3 | perl.h                                  
#28  |   15 |   17 |    2 |       2 | util.h                                  
#29  |   14 |   24 |   10 |       2 | invlist_inline.h                        
#30  |   14 |   22 |    8 |       1 | cpan/Pod-Simple/lib/Pod/Simple/XHTML.pm 
#31  |   13 |   22 |    9 |       3 | pod/perlsyn.pod                         
#32  |   12 |   17 |    5 |       1 | cpan/Module-Metadata/lib/Module/Metadata.pm
#33  |   12 |   12 |    0 |       2 | win32/pod.mak                           
#34  |   11 |  125 |  114 |      16 | embed.fnc                               
#35  |   11 |   40 |   29 |       5 | regcomp_study.c                         
#36  |    9 |    9 |    0 |       2 | dist/Module-CoreList/Changes            
#37  |    9 |    9 |    0 |       1 | t/re/pat_advanced.t                     
#38  |    8 |    8 |    0 |       1 | cpan/Module-Metadata/t/extract-package.t
#39  |    8 |    8 |    0 |       1 | hv.h                                    
#40  |    7 |   12 |    5 |       2 | ext/POSIX/t/time.t                      
#41  |    7 |    9 |    2 |       1 | regen/regcharclass.pl                   
#42  |    6 |  283 |  277 |       3 | dump.c                                  
#43  |    6 |   13 |    7 |       3 | regcomp.h                               
#44  |    6 |    9 |    3 |       4 | pod/perlfunc.pod                        
#45  |    6 |    7 |    1 |       1 | pod/perlgov.pod                         
#46  |    5 |    5 |    0 |       3 | pod/perlhist.pod                        
#47  |    5 |    5 |    0 |       1 | Porting/make-rmg-checklist              
#48  |    4 |  159 |  155 |       6 | regexec.c                               
#49  |    4 |   25 |   21 |       6 | perl.c                                  
#50  |    4 |   10 |    6 |       3 | pod/perl.pod                            
#51  |    4 |    5 |    1 |       1 | dist/ExtUtils-ParseXS/Changes           
#52  |    4 |    4 |    0 |       1 | dist/Exporter/Changes                   
#53  |    4 |    4 |    0 |       1 | win32/win32.h                           
#54  |    3 |  156 |  153 |       5 | MANIFEST                                
#55  |    3 |   78 |   75 |       4 | regcomp_debug.c                         
#56  |    3 |   38 |   35 |       7 | gv.c                                    
#57  |    3 |   37 |   34 |       5 | pod/perlvar.pod                         
#58  |    3 |   10 |    7 |       2 | hv.c                                    
#59  |    3 |    6 |    3 |       4 | Porting/core-team.json                  
#60  |    3 |    4 |    1 |       4 | AUTHORS                                 
#61  |    3 |    4 |    1 |       1 | t/op/sub.t                              
#62  |    3 |    3 |    0 |       1 | t/loc_tools.pl                          
#63  |    2 |   70 |   68 |       6 | regcomp.c                               
#64  |    2 |   62 |   60 |       4 | regcomp_trie.c                          
#65  |    2 |   12 |   10 |       7 | Porting/Maintainers.pl                  
#66  |    2 |    8 |    6 |       2 | pod/perldeprecation.pod                 
#67  |    2 |    7 |    5 |       4 | Porting/release_schedule.pod            
#68  |    2 |    2 |    0 |       1 | Porting/release_announcement_template.txt
#69  |    1 |   22 |   21 |       2 | mro_core.c                              
#70  |    1 |    6 |    5 |       1 | .mailmap                                
#71  |    1 |    5 |    4 |       2 | Configure                               
#72  |    1 |    4 |    3 |       1 | cpan/Pod-Simple/lib/Pod/Simple/HTMLBatch.pm
#73  |    1 |    3 |    2 |       1 | cpan/Pod-Simple/lib/Pod/Simple/HTML.pm  
#74  |    1 |    2 |    1 |       1 | ext/File-Glob/Glob.pm                   
#75  |    1 |    2 |    1 |       1 | regen/opcodes                           
#76  |    1 |    1 |    0 |       1 | t/porting/known_pod_issues.dat          
#77  |   -1 |   18 |   19 |       1 | cop.h                                   
#78  |   -1 |   11 |   12 |       2 | utf8.c                                  
#79  |   -1 |    2 |    3 |       1 | vutil.c                                 
#80  |   -1 |    1 |    2 |       1 | cpan/version/lib/version.pm             
#81  |   -1 |    1 |    2 |       1 | pp_pack.c                               
#82  |   -6 |   20 |   26 |      11 | util.c                                  
#83  |   -8 |    1 |    9 |       1 | t/re/pat_rt_report.t                    
#84  |   -9 |    7 |   16 |       1 | pod/perlclib.pod                        
#85  |  -14 |   38 |   52 |      11 | sv.c                                    
#86  |  -96 |  372 |  468 |       5 | pod/perldelta.pod                       
#87  | -127 |   19 |  146 |      10 | embed.h                                 
#88  | -179 |  204 |  383 |      19 | toke.c                                  
% perl Porting/updateAUTHORS.pl v5.43.6..v5.43.7  --chainsaw
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
% perl Porting/updateAUTHORS.pl v5.43.9..v5.43.10 --chainsaw
#Pos |  L+- |  L++ |  L-- | commits | Name                                    
#----+------+------+------+---------+-----------------------------------------
#1   | -179 |  204 |  383 |      19 | toke.c                                  
#2   | -127 |   19 |  146 |      10 | embed.h                                 
#3   |  -96 |  372 |  468 |       5 | pod/perldelta.pod                       
#4   |  -14 |   38 |   52 |      11 | sv.c                                    
#5   |   -9 |    7 |   16 |       1 | pod/perlclib.pod                        
#6   |   -8 |    1 |    9 |       1 | t/re/pat_rt_report.t                    
#7   |   -6 |   20 |   26 |      11 | util.c                                  
#8   |   -1 |    1 |    2 |       1 | pp_pack.c                               
#9   |   -1 |    1 |    2 |       1 | cpan/version/lib/version.pm             
#10  |   -1 |    2 |    3 |       1 | vutil.c                                 
#11  |   -1 |   11 |   12 |       2 | utf8.c                                  
#12  |   -1 |   18 |   19 |       1 | cop.h                                   
#13  |    1 |    1 |    0 |       1 | t/porting/known_pod_issues.dat          
#14  |    1 |    2 |    1 |       1 | regen/opcodes                           
#15  |    1 |    2 |    1 |       1 | ext/File-Glob/Glob.pm                   
#16  |    1 |    3 |    2 |       1 | cpan/Pod-Simple/lib/Pod/Simple/HTML.pm  
#17  |    1 |    4 |    3 |       1 | cpan/Pod-Simple/lib/Pod/Simple/HTMLBatch.pm
#18  |    1 |    5 |    4 |       2 | Configure                               
#19  |    1 |    6 |    5 |       1 | .mailmap                                
#20  |    1 |   22 |   21 |       2 | mro_core.c                              
#21  |    2 |    2 |    0 |       1 | Porting/release_announcement_template.txt
#22  |    2 |    7 |    5 |       4 | Porting/release_schedule.pod            
#23  |    2 |    8 |    6 |       2 | pod/perldeprecation.pod                 
#24  |    2 |   12 |   10 |       7 | Porting/Maintainers.pl                  
#25  |    2 |   62 |   60 |       4 | regcomp_trie.c                          
#26  |    2 |   70 |   68 |       6 | regcomp.c                               
#27  |    3 |    3 |    0 |       1 | t/loc_tools.pl                          
#28  |    3 |    4 |    1 |       1 | t/op/sub.t                              
#29  |    3 |    4 |    1 |       4 | AUTHORS                                 
#30  |    3 |    6 |    3 |       4 | Porting/core-team.json                  
#31  |    3 |   10 |    7 |       2 | hv.c                                    
#32  |    3 |   37 |   34 |       5 | pod/perlvar.pod                         
#33  |    3 |   38 |   35 |       7 | gv.c                                    
#34  |    3 |   78 |   75 |       4 | regcomp_debug.c                         
#35  |    3 |  156 |  153 |       5 | MANIFEST                                
#36  |    4 |    4 |    0 |       1 | win32/win32.h                           
#37  |    4 |    4 |    0 |       1 | dist/Exporter/Changes                   
#38  |    4 |    5 |    1 |       1 | dist/ExtUtils-ParseXS/Changes           
#39  |    4 |   10 |    6 |       3 | pod/perl.pod                            
#40  |    4 |   25 |   21 |       6 | perl.c                                  
#41  |    4 |  159 |  155 |       6 | regexec.c                               
#42  |    5 |    5 |    0 |       1 | Porting/make-rmg-checklist              
#43  |    5 |    5 |    0 |       3 | pod/perlhist.pod                        
#44  |    6 |    7 |    1 |       1 | pod/perlgov.pod                         
#45  |    6 |    9 |    3 |       4 | pod/perlfunc.pod                        
#46  |    6 |   13 |    7 |       3 | regcomp.h                               
#47  |    6 |  283 |  277 |       3 | dump.c                                  
#48  |    7 |    9 |    2 |       1 | regen/regcharclass.pl                   
#49  |    7 |   12 |    5 |       2 | ext/POSIX/t/time.t                      
#50  |    8 |    8 |    0 |       1 | hv.h                                    
#51  |    8 |    8 |    0 |       1 | cpan/Module-Metadata/t/extract-package.t
#52  |    9 |    9 |    0 |       1 | t/re/pat_advanced.t                     
#53  |    9 |    9 |    0 |       2 | dist/Module-CoreList/Changes            
#54  |   11 |   40 |   29 |       5 | regcomp_study.c                         
#55  |   11 |  125 |  114 |      16 | embed.fnc                               
#56  |   12 |   12 |    0 |       2 | win32/pod.mak                           
#57  |   12 |   17 |    5 |       1 | cpan/Module-Metadata/lib/Module/Metadata.pm
#58  |   13 |   22 |    9 |       3 | pod/perlsyn.pod                         
#59  |   14 |   22 |    8 |       1 | cpan/Pod-Simple/lib/Pod/Simple/XHTML.pm 
#60  |   14 |   24 |   10 |       2 | invlist_inline.h                        
#61  |   15 |   17 |    2 |       2 | util.h                                  
#62  |   16 |   19 |    3 |       3 | perl.h                                  
#63  |   18 |   18 |    0 |       1 | lib/builtin.t                           
#64  |   18 |   20 |    2 |       3 | handy.h                                 
#65  |   18 |   22 |    4 |       1 | cpan/Pod-Simple/t/xhtml01.t             
#66  |   18 |   99 |   81 |      12 | op.c                                    
#67  |   21 |   22 |    1 |       3 | dist/Module-CoreList/lib/Module/CoreList/Utils.pm
#68  |   23 |   23 |    0 |       1 | t/class/inherit.t                       
#69  |   23 |   24 |    1 |       3 | autodoc.pl                              
#70  |   32 |   45 |   13 |       3 | class.c                                 
#71  |   33 |   44 |   11 |       2 | pod/perlrebackslash.pod                 
#72  |   34 |   48 |   14 |       1 | cpan/Pod-Simple/t/xhtml25.t             
#73  |   34 |   98 |   64 |       7 | pp_ctl.c                                
#74  |   35 |   36 |    1 |       1 | t/op/lexsub.t                           
#75  |   40 |  123 |   83 |      12 | regen/embed.pl                          
#76  |   45 |   45 |    0 |       1 | Porting/bisect-runner.pl                
#77  |   47 |   67 |   20 |       3 | pod/perlhacktips.pod                    
#78  |   48 |   69 |   21 |       4 | pod/perlre.pod                          
#79  |   53 |  100 |   47 |       4 | Porting/release_managers_guide.pod      
#80  |   57 |   57 |    0 |       3 | Porting/epigraphs.pod                   
#81  |   72 |   72 |    0 |       1 | cpan/Module-Metadata/t/extract-version.t
#82  |   89 |   92 |    3 |       5 | dist/Module-CoreList/lib/Module/CoreList.pm
#83  |  126 |  126 |    0 |       1 | pod/perl5422delta.pod                   
#84  |  127 |  127 |    0 |       1 | pod/perl5404delta.pod                   
#85  |  151 |  182 |   31 |       4 | pod/perlhack.pod                        
#86  |  188 |  208 |   20 |       3 | long_names.c                            
#87  |  261 |  261 |    0 |       1 | pod/perl5439delta.pod                   
#88  |  615 | 6692 | 6077 |      11 | proto.h                                 
% perl Porting/updateAUTHORS.pl --from=v5.43.6 --to=v5.43.7  --thanks-applied
#Pos | Applied | Name           
#----+---------+----------------
#1   |       4 | Karl Williamson
#2   |       3 | James E Keenan 
% perl Porting/updateAUTHORS.pl --from=v5.43.9 --to=v5.43.10 --thanks-applied
#Pos | Applied | Name                  
#----+---------+-----------------------
#1   |       8 | Tony Cook             
#2   |       7 | Karl Williamson       
#3   |       4 | James E Keenan        
#4   |       2 | Philippe Bruhat (BooK)
#5   |       1 | Leon Timmermans       
#6   |       1 | Paul Evans            
% perl Porting/updateAUTHORS.pl v5.43.6..v5.43.7  --stats
#Pos | Authored | Applied | Committed | Name                
#----+----------+---------+-----------+---------------------
#1   |       85 |       4 |        89 | Karl Williamson     
#2   |        7 |       0 |         7 | Tony Cook           
#3   |        5 |       0 |         5 | Steve Hay           
#4   |        5 |       0 |         4 | Paul Evans          
#5   |        4 |       0 |         4 | David Mitchell      
#6   |        4 |       0 |         4 | Max Maischein       
#7   |        2 |       0 |         2 | Lukas Mai           
#8   |        2 |       0 |         0 | Bartosz Jarzyna     
#9   |        1 |       3 |         4 | James E Keenan      
#10  |        1 |       0 |         1 | Thibault Duponchelle
#11  |        1 |       0 |         0 | Dan Church          
#12  |        1 |       0 |         0 | Graham Knop         
#13  |        1 |       0 |         0 | Samuel Young        
#14  |        1 |       0 |         0 | TAKAI Kousuke       
% perl Porting/updateAUTHORS.pl v5.43.9..v5.43.10 --stats
#Pos | Authored | Applied | Committed | Name                  
#----+----------+---------+-----------+-----------------------
#1   |      109 |       7 |       115 | Karl Williamson       
#2   |       13 |       2 |         9 | Philippe Bruhat (BooK)
#3   |       10 |       0 |         7 | Eric Herman           
#4   |        9 |       8 |        17 | Tony Cook             
#5   |        9 |       0 |         4 | Richard Leach         
#6   |        8 |       0 |         8 | Steve Hay             
#7   |        6 |       0 |         5 | Lukas Mai             
#8   |        5 |       4 |         6 | James E Keenan        
#9   |        4 |       0 |         4 | Craig A. Berry        
#10  |        4 |       0 |         0 | Dmitrii Kuvaiskii     
#11  |        3 |       1 |         4 | Leon Timmermans       
#12  |        3 |       1 |         4 | Paul Evans            
#13  |        3 |       0 |         2 | Karen Etheridge       
#14  |        2 |       0 |         0 | E. Choroba            
#15  |        2 |       0 |         0 | James Cook            
#16  |        1 |       0 |         1 | Nicolas R             
#17  |        1 |       0 |         0 | Christian Hansen      
#18  |        1 |       0 |         0 | Daniel Tang           
#19  |        1 |       0 |         0 | Robert Rothenberg     
#20  |        1 |       0 |         0 | Shirakata Kentaro     
#21  |        1 |       0 |         0 | Thibault Duponchelle  
