# A plotting R script produced by the Revigo server at http://revigo.irb.hr/
# If you found Revigo useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# --------------------------------------------------------------------------
# If you don't have the ggplot2 package installed, uncomment the following line:
# install.packages( "ggplot2" );
library( ggplot2 );
library(ggrepel);

# --------------------------------------------------------------------------
# If you don't have the scales package installed, uncomment the following line:
# install.packages( "scales" );
library( scales );

# --------------------------------------------------------------------------
# Here is your data from Revigo. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency","plot_X","plot_Y","log_size","value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0048731","system development",1.41358736509658,0.570381098168,7.5206094314032,5.53301538667045,0.5,1,0),
c("GO:0060255","regulation of macromolecule \n metabolic process",13.2061981350643,3.33646216655181,-6.21909420699856,6.50346940416126,1,0.92340852302116,0),
c("GO:0065007","biological regulation",23.3881336449155,6.28998548302851,-1.81914664907473,6.75168710288703,1,1,0),
c("GO:1990748","cellular detoxification",0.89902191009872,-1.30420395144044,-6.31987585098249,5.3364637365442,1,0.845847975638854,0),
c("GO:0051651","maintenance of \n location in cell",0.0478592315494418,4.87071700331702,1.93825639207548,4.06269477334239,1,0.877188727429724,0.00881524),
c("GO:1902221","erythrose 4-phosphate/phosphoenolpyruvate \n family amino acid metabolic process",0.099745399825516,-6.28876779210602,4.01626617953485,4.3816023727597,1,0.779138852017395,0.00937225),
c("GO:0007018","microtubule-based \n movement",0.348462600902316,5.16922630037797,-4.98518628160856,4.92485279635564,0.5,0.987503783799394,0.01050269),
c("GO:0042546","cell wall \n biogenesis",0.852637564840103,4.5276713211743,-3.51808989718123,5.31345803188855,0.5,0.961268250924015,0.01149442),
c("GO:0016999","antibiotic metabolic \n process",0.156636238436746,6.55889577932763,-0.67429416232328,4.57759519097732,0.5,0.968036703053133,0.02605735),
c("GO:0005985","sucrose metabolic \n process",0.0278322643307782,3.51852357424817,-2.16641168670451,3.82730464108973,1,0.912030386779663,0.04608187),
c("GO:0072593","reactive oxygen species \n metabolic process",0.272858106741498,6.14538123097241,-3.23470136409886,4.81863491458991,0.5,0.938527246717317,0.05019054),
c("GO:0097659","nucleic acid-templated \n transcription",1.98730984634916,-5.45101129317145,-0.912709174292249,5.68095794880826,1,0.742209967481423,0.07977117),
c("GO:0016567","protein ubiquitination",0.884049328483443,-1.84341780785539,-0.230442517789245,5.32916999296888,1,0.863294381640608,0.1616638),
c("GO:0006575","cellular modified amino \n acid metabolic process",1.18135906131608,-4.44483971223975,6.12813231816838,5.45507489895714,1,0.882689112308411,0.16763629),
c("GO:0019432","triglyceride \n biosynthetic process",0.0362548593567491,-1.60728729448422,5.18522202787924,3.94210730898936,1,0.841233844243878,0.1929296),
c("GO:0044106","cellular amine \n metabolic process",0.494269196742954,-7.79010728132943,-1.48658384164023,5.07665864506939,1,0.814823039836515,0.21415452),
c("GO:0030001","metal ion \n transport",1.91650701851156,3.79605486579912,3.76245238831301,5.66520281198914,1,0.826457079899297,0.23405827),
c("GO:0072527","pyrimidine-containing \n compound metabolic process",1.0281531763872,-6.7489641947632,-1.2745997755422,5.39475103068482,0.5,0.834559673168637,0.28235056),
c("GO:0044282","small molecule \n catabolic process",1.72299033692617,-4.87230873861556,4.45969104402287,5.618975345187,1,0.769329350351512,0.2835506),
c("GO:0010876","lipid localization",0.432804553454561,4.78898040809118,2.76758034038843,5.01898743756423,1,0.888845741068419,0.28890394),
c("GO:0009611","response to wounding",0.107099116584541,-2.64875432070584,-6.64856099196816,4.41249414725064,1,0.876779773529645,0.29672879),
c("GO:0046134","pyrimidine nucleoside \n biosynthetic process",0.00023614752409264,-6.84608973047518,1.32079529106003,1.76342799356294,0.5,0.768728851828478,0.30513211),
c("GO:0034032","purine nucleoside bisphosphate \n metabolic process",0.578876297392426,-5.53397766881041,1.11254400408544,5.14528033466116,1,0.706136983817422,0.33767169),
c("GO:0051707","response to other \n organism",0.700036549008027,-0.925131383839413,-6.71894033217008,5.22781474453697,1,0.880712558014404,0.35431675),
c("GO:0009607","response to biotic \n stimulus",0.755315784340801,-1.44673071178951,-6.99059575182907,5.26082240178297,1,0.89869192831616,0.35712264),
c("GO:0006388","tRNA splicing, via \n endonucleolytic \n cleavage and ligation",0.033632378957615,-6.65737716176167,-3.19378051022909,3.90950254140542,1,0.855637921473055,0.38840749),
c("GO:0009452","7-methylguanosine RNA capping",0.0384671887929854,-6.72573555521946,-2.95734410528707,3.96782867933016,0.5,0.854355707944531,0.39283558),
c("GO:0009605","response to external \n stimulus",1.84451931011448,-1.78078832620597,-6.82025324293566,5.6485756407683,1,0.890483210193792,0.39375313),
c("GO:0006301","postreplication \n repair",0.0391259160970333,-3.46284036779753,-4.39444694266964,3.97520196225785,0.5,0.749610861937578,0.39457445),
c("GO:0000737","DNA catabolic process, \n endonucleolytic",0.0124868182037758,-3.59899760593896,-0.373929291025631,3.47928731647617,1,0.812278677770799,0.40289325),
c("GO:0007186","G protein-coupled receptor \n signaling pathway",1.16647762435922,-0.179984512419271,-6.40881828822012,5.44956941407044,1,0.839030883196158,0.42685292),
c("GO:0046394","carboxylic acid \n biosynthetic process",4.36315694273306,-5.57862158320135,3.03392497001748,6.02249270634328,1,0.684845738123588,0.44020352),
c("GO:0042435","indole-containing compound \n biosynthetic process",0.210896310770805,-5.82578283545589,-0.267703755516243,4.70676897316823,1,0.77897380709851,0.44647492),
c("GO:0000731","DNA synthesis involved \n in DNA repair",0.0375101698795573,-3.62234561766366,-3.36299479500671,3.95688845465008,0.5,0.705328073511978,0.46636091),
c("GO:0051234","establishment of \n localization",18.1310257494432,4.18480006942569,3.2253630641433,6.64111393304831,0.5,0.861368476273562,0.47948023),
c("GO:0042744","hydrogen peroxide \n catabolic process",0.125680198085515,-1.99189971977619,6.98795909787892,4.48197263156396,0.5,0.868961507017721,0.48951169),
c("GO:0006835","dicarboxylic acid \n transport",0.0635858280662078,3.96410260007654,4.2424495126172,4.18608008609145,1,0.864845689894392,0.49647804),
c("GO:0120029","proton export across \n plasma membrane",0.0144588571769003,3.17924821999815,4.71963460055274,3.54294984881418,0.5,0.872651150682296,0.50397249),
c("GO:0006952","defense response",0.973507810724362,-2.12806318825505,-6.39727271842891,5.37103274768131,1,0.854208608710762,0.50513054),
c("GO:0044242","cellular lipid \n catabolic process",0.231466003000979,-1.85343312646683,6.21827394165458,4.74718644459437,1,0.831972915350195,0.51902333),
c("GO:0015914","phospholipid transport",0.111776494737183,4.83453761429423,3.2454538080496,4.43105804194203,1,0.892141126262924,0.52591005),
c("GO:0001510","RNA methylation",0.8507566705254,-5.49629877300892,-2.25889196005802,5.3124989369668,0.5,0.811481656497431,0.53288377),
c("GO:0009072","aromatic amino acid \n family metabolic process",0.764869401719005,-5.71693185035326,1.76245087591382,5.26628109899437,1,0.728682665284558,0.55222224),
c("GO:0009116","nucleoside metabolic \n process",0.759533296262315,-6.17656130772432,0.856591658278059,5.26324064514753,1,0.690516706256131,0.56373213),
c("GO:1901606","alpha-amino acid \n catabolic process",0.576846257273033,-4.90131355511048,3.97277856639389,5.1437546574054,1,0.700940940924348,0.57044681),
c("GO:0042276","error-prone \n translesion synthesis",0.0108917866813956,-3.66088612423594,-3.62252119020883,3.41995574848976,0.5,0.726827692576748,0.58083994),
c("GO:0006811","ion transport",5.1712786278122,4.03206407833744,2.97211301928017,6.09628974519501,0.5,0.878323651650405,0.58140331),
c("GO:0009218","pyrimidine ribonucleotide \n metabolic process",0.432970271015327,-5.83354906269826,1.13427839493609,5.019153692189,0.5,0.701320158350691,0.58164421),
c("GO:0006979","response to \n oxidative stress",0.576489964517384,-2.32485128849104,-6.53260761945537,5.14348633171154,0.5,0.860213473436392,0.59199593),
c("GO:0034755","iron ion transmembrane \n transport",0.142185667137885,3.33266961630725,4.14076722002691,4.53555993326044,0.5,0.845436777656956,0.61357701),
c("GO:0044264","cellular polysaccharide \n metabolic process",0.711379916042512,1.51612492206229,-2.09731733626552,5.23479558822064,0.5,0.867952160340376,0.62356372),
c("GO:0006656","phosphatidylcholine \n biosynthetic process",0.0268835312953885,-2.5617622460666,4.00527662912027,3.81224469680037,0.5,0.793574518563072,0.63248929),
c("GO:0006817","phosphate ion \n transport",0.3099456968411,3.71596763314973,4.08669865360937,4.87398287532198,0.5,0.854020020944761,0.63881018),
c("GO:0050794","regulation of \n cellular process",19.8740720541611,3.21218036002903,-6.34745164888404,6.68097840970064,1,0.936704400838308,0.65543883),
c("GO:0010411","xyloglucan metabolic \n process",0.0241450486037177,2.84774664671136,-2.61147816977,3.76559405531945,0.5,0.882836847771013,0.66296461),
c("GO:0009070","serine family amino acid \n biosynthetic process",0.352700827518926,-5.34889256669973,3.06902583910414,4.93010303909091,1,0.710273464752625,0.6775176),
c("GO:0009110","vitamin biosynthetic \n process",1.27188227888492,-5.84776725921693,3.13573201796971,5.48713979011489,1,0.73108926860835,0.68595876),
c("GO:0009636","response to toxic \n substance",1.03353071123408,-1.28877859503789,-6.53629111382168,5.39701658617025,1,0.867034374727243,0.69420757),
c("GO:0015743","malate transport",0.0169984787956509,3.76190264210389,4.523082700821,3.61320735210376,1,0.876458038428292,0.6989851));

one.data <- data.frame(revigo.data);
names(one.data) <- revigo.names;
one.data <- one.data [(one.data$plot_X != "null" & one.data$plot_Y != "null"), ];
one.data$plot_X <- as.numeric( as.character(one.data$plot_X) );
one.data$plot_Y <- as.numeric( as.character(one.data$plot_Y) );
one.data$log_size <- as.numeric( as.character(one.data$log_size) );
one.data$value <- as.numeric( as.character(one.data$value) );
one.data$frequency <- as.numeric( as.character(one.data$frequency) );
one.data$uniqueness <- as.numeric( as.character(one.data$uniqueness) );
one.data$dispensability <- as.numeric( as.character(one.data$dispensability) );
#head(one.data);


# --------------------------------------------------------------------------
# Names of the axes, sizes of the numbers and letters, names of the columns,
# etc. can be changed below
ggplot(one.data, aes(plot_X, plot_Y, colour = value, size = 10), alpha = I(0.6)) + scale_size_area() +
  geom_point() +
  geom_point( aes(plot_X, plot_Y, size = 10), shape = 21) + scale_size_area() +
  scale_size( range=c(5, 30)) + theme_bw() +
  geom_text(aes(plot_X, plot_Y, label = description, sep="\n"), colour = I(alpha("black", 0.85)), size = 6) +
  labs (y = "semantic space x", x = "semantic space y")+
  theme(legend.key = element_blank(), text = element_text(size= 15), legend.position = "none") +
  #geom_text_repel(aes(label=description), size = 3, colour="black", box.padding = 0.5)
  



#default settings from revigo
p1 <- ggplot( data = one.data );
p1 <- p1 + geom_point( aes( plot_X, plot_Y, colour = value, size = log_size), alpha = I(0.5) ) + scale_size_area();
p1 <- p1 + scale_colour_gradient( colours = c("blue", "green", "yellow", "red"), limits = c( min(one.data$value), 0) );
p1 <- p1 + geom_point( aes(plot_X, plot_Y, size = log_size), shape = 21) + scale_size_area();
p1 <- p1 + scale_size( range=c(5, 30)) + theme_bw();  + scale_fill_gradientn(colours = heat_hcl(7), limits = c(-300, 0) );
#ex <- one.data [ one.data$dispensability < 0.15, ];
p1 <- p1 + geom_text( data = ex, aes(plot_X, plot_Y, label = description), colour = I(alpha("black", 0.85)), size = 3 );
p1 <- p1 + labs (y = "semantic space x", x = "semantic space y");
p1 <- p1 + theme(legend.key = element_blank()) ;
one.x_range = max(one.data$plot_X) - min(one.data$plot_X);
one.y_range = max(one.data$plot_Y) - min(one.data$plot_Y);
p1 <- p1 + xlim(min(one.data$plot_X)-one.x_range/10,max(one.data$plot_X)+one.x_range/10);
p1 <- p1 + ylim(min(one.data$plot_Y)-one.y_range/10,max(one.data$plot_Y)+one.y_range/10);


# --------------------------------------------------------------------------
# Output the plot to screen

p1;

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

# ggsave("/path_to_your_file/revigo-plot.pdf");

