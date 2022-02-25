# A plotting R script produced by the Revigo server at http://revigo.irb.hr/
# If you found Revigo useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# --------------------------------------------------------------------------
# If you don't have the ggplot2 package installed, uncomment the following line:
# install.packages( "ggplot2" );
library( ggplot2 );

# --------------------------------------------------------------------------
# If you don't have the scales package installed, uncomment the following line:
# install.packages( "scales" );
library( scales );

# --------------------------------------------------------------------------
# Here is your data from Revigo. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency","plot_X","plot_Y","log_size","value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0015399","primary active transmembrane \n transporter activity",1.86521939445299,-4.55278444167165,4.26971021824263,5.73221759355807,1,0.795087090196536,0),
c("GO:0050242","pyruvate, phosphate \n dikinase activity",0.0170046030606972,6.98488047007639,-0.058532846602658,3.69214160936678,1,0.917333160754071,0),
c("GO:0060089","molecular transducer \n activity",1.53333073248027,-0.388831175717421,6.34192746147347,5.64712368543817,0.5,1,0),
c("GO:0061135","endopeptidase regulator \n activity",0.19354355160123,0.296823120492447,4.44600486344465,4.74827332647351,1,0.947715536544251,0),
c("GO:0070402","NADPH binding",0.0323747462051763,-5.00713942357083,-4.31538219828708,3.97173959088778,1,0.953789519723236,0),
c("GO:0030604","1-deoxy-D-xylulose-5-phosphate \n reductoisomerase activity",0.0242542793909843,0.96509940778375,-6.64502551221733,3.84633711212981,1,0.926416737383729,0.01948846),
c("GO:0008446","GDP-mannose \n 4,6-dehydratase activity",0.0195340420853732,6.29375202578863,-4.14298662329606,3.7523558041535,1,0.948405565412568,0.0196487),
c("GO:0016887","ATP hydrolysis \n activity",2.0948316407804,-2.41042910167221,-0.102207727976109,5.78263670774709,1,0.873484958137068,0.02718429),
c("GO:0003756","protein disulfide \n isomerase activity",0.0275715764725266,2.91198101059061,-2.69875904388211,3.90200289135073,1,0.958605642010007,0.0274732),
c("GO:0016886","ligase activity, forming \n phosphoric ester bonds",0.124529950233978,-7.1191787232648,0.054392081033464,4.55677273179351,1,0.95491904984674,0.03139804),
c("GO:0042277","peptide binding",0.0995983893555124,1.6960133428709,6.64681448407122,4.45975424911451,1,0.950129267413886,0.03636764),
c("GO:0031683","G-protein beta/gamma-subunit \n complex binding",0.0450115747751762,-0.686406388932805,7.89408177710627,4.11484441314502,1,0.983903384101178,0.0371875),
c("GO:0008061","chitin binding",0.116015554391353,-1.87214834549333,7.65953996871988,4.52601602134075,1,0.975970054618856,0.03976298),
c("GO:0016829","lyase activity",3.64764458257915,2.86242653126576,7.76544038983008,6.02349979296737,1,0.965181002735409,0.0461735),
c("GO:0016740","transferase activity",21.6567943099232,0.685592048553214,8.1218908966526,6.79708110744717,1,0.957313884185541,0.06845309),
c("GO:0016491","oxidoreductase activity",12.8868214602721,3.98485303309397,7.15259087992936,6.57163279451014,0.5,0.95988903318808,0.09259411),
c("GO:0043565","sequence-specific \n DNA binding",1.62864773528992,-5.8646975817924,-2.22756845131073,5.67331494756535,1,0.965667193540869,0.09435859),
c("GO:0046524","sucrose-phosphate \n synthase activity",0.00434013034835109,3.66564171811112,2.7603754226017,3.09933527768596,1,0.902706087435691,0.12801802),
c("GO:0020037","heme binding",1.45219171917643,-6.50662891212116,-2.67384243506433,5.62351185576924,0.5,0.96614464195142,0.1373417),
c("GO:0043169","cation binding",17.8618859255482,-3.72199326020061,-5.52408797708037,6.71341426185172,1,0.944835108789207,0.14501605),
c("GO:0008374","O-acyltransferase activity",0.204255656760377,6.49679771310437,2.44736880373023,4.77166830651194,1,0.895601075808018,0.1611692),
c("GO:0003864","3-methyl-2-oxobutanoate \n hydroxymethyltransferase activity",0.0271672808907136,5.82763935621897,4.30737003625456,3.89558827566626,1,0.923108146327375,0.16641149),
c("GO:0004789","thiamine-phosphate \n diphosphorylase activity",0.0276061316504593,5.16023346207763,3.67616513996637,3.90254677931399,0.5,0.928079453959932,0.16659683),
c("GO:0030976","thiamine pyrophosphate \n binding",0.224176716838597,-4.03109122766498,-4.76763642886941,4.8120840651322,1,0.9259525584754,0.18592459),
c("GO:0009916","alternative oxidase \n activity",0.00789585815762918,2.76237437527226,-6.25967691864826,3.35907622605926,1,0.922982396908066,0.20088083),
c("GO:0004556","alpha-amylase \n activity",0.0267906294512468,-1.82341063562733,-1.76321565455815,3.88952579667119,1,0.954006674177156,0.21273659),
c("GO:0003997","acyl-CoA oxidase \n activity",0.0221291359481213,0.822455076221382,-6.02338647646337,3.8065191340807,1,0.932872379610078,0.21324729),
c("GO:0008483","transaminase \n activity",0.72781843520816,5.65377801895248,1.72522279731554,5.32351198014278,0.5,0.909564292481425,0.21563301),
c("GO:0004114","3',5'-cyclic-nucleotide \n phosphodiesterase activity",0.0537022020252582,-0.838070232696318,-0.130691309345989,4.19150690462415,0.5,0.947523989628773,0.22571906),
c("GO:0016667","oxidoreductase activity, \n acting on a sulfur group of donors",0.574939416998169,2.09880444744172,-6.18995143804575,5.22111156086213,1,0.915969333317623,0.26476592),
c("GO:0005509","calcium ion \n binding",1.11670931869871,-2.90121225795114,-5.99478326308884,5.50942835052007,1,0.950371257280572,0.26706808),
c("GO:0004791","thioredoxin-disulfide \n reductase activity",0.0388503865497702,2.17917021383617,-4.84589633591216,4.0509208369354,1,0.893138206912494,0.27435238),
c("GO:0000166","nucleotide \n binding",19.7258993442913,-5.28452112642723,-3.63785482685656,6.756523755194,1,0.920363854289593,0.30832781),
c("GO:0005506","iron ion binding",1.47673971757984,-2.89737710370965,-5.6626357171856,5.63079183821989,0.5,0.948777052943437,0.32735329),
c("GO:0000213","tRNA-intron \n endonuclease activity",0.0109850910648154,0.0953013944118625,-0.298981292428846,3.50242711998443,0.5,0.940820678207421,0.33906516),
c("GO:0000234","phosphoethanolamine \n N-methyltransferase activity",0.00122670881661197,5.37030055237882,5.18136478637551,2.55144999797288,0.5,0.934783829197626,0.34560539),
c("GO:0016817","hydrolase activity, \n acting on acid anhydrides",3.86901196345182,-1.23318288099165,-1.02927552121933,6.04908732689898,0.5,0.931585757110247,0.36135915),
c("GO:0004419","hydroxymethylglutaryl-CoA \n lyase activity",0.0117971377462346,6.13094096853143,-4.4179378715442,3.53339070801755,1,0.953619139110097,0.36282744),
c("GO:0016705","oxidoreductase activity, \n acting on paired donors, \n with incorporation or \n reduction of molecular oxygen",1.28494465798201,1.67393583833132,-6.07613295993403,5.57037245751527,0.5,0.910574874119218,0.37525426),
c("GO:0004672","protein kinase activity",3.45254604797095,5.20808100400796,0.314384129571683,5.9996267807194,1,0.846713772021769,0.37767493),
c("GO:0003839","gamma-glutamylcyclotransferase \n activity",0.024655119455004,5.882669676866,-4.53069055317488,3.85345484136807,0.5,0.951801365935589,0.37870107),
c("GO:0022839","ion gated channel \n activity",0.0537091130608448,-5.18579983058497,4.26189990694616,4.19156278759173,0.5,0.818022290749156,0.3806982),
c("GO:0004298","threonine-type \n endopeptidase activity",0.0758555265979325,0.847357811948671,-1.82850949184959,4.34149387739903,0.5,0.928756122372608,0.38179425),
c("GO:0004497","monooxygenase activity",1.21069940267574,1.84083633976872,-6.40602221384644,5.54452443408838,0.5,0.910992642061818,0.40712402),
c("GO:0005319","lipid transporter \n activity",0.146044004014897,-4.23100016988805,5.16446977095526,4.62598087331167,1,0.840321551318588,0.41416652),
c("GO:0008963","phospho-N-acetylmuramoyl-pentapeptide-transferase \n activity",0.055267551585611,6.66766720530059,0.517258482669952,4.20398424442013,0.5,0.911090137492854,0.41864065),
c("GO:0004592","pantoate-beta-alanine \n ligase activity",0.0252978457645528,-6.97176176870116,-0.126497813513688,3.86462972454551,1,0.955635547198253,0.43471374),
c("GO:0033862","UMP kinase activity",0.0352290039024199,6.00553355818999,-0.276314358097482,4.00842982679723,0.5,0.889648955478841,0.46393878),
c("GO:0004108","citrate (Si)-synthase \n activity",0.0234111330494257,6.9421255818326,2.71115093098805,3.83097339732265,0.5,0.909417604188418,0.46440988),
c("GO:0046872","metal ion \n binding",17.6916740300871,-3.38711195948899,-5.38283350029294,6.70925588010616,0.5,0.930206892709183,0.47578021),
c("GO:0016758","hexosyltransferase \n activity",0.940899484412557,4.98213381949902,2.2799278728589,5.43503169192914,0.5,0.884779862594422,0.49089693),
c("GO:0004471","malate dehydrogenase \n (decarboxylating) (NAD+) activity",0.0508859550237406,1.266218191323,-6.6251085612632,4.16811428681953,1,0.923141242400825,0.49197332),
c("GO:0004144","diacylglycerol \n O-acyltransferase activity",0.0335634443260622,7.05272696702736,2.26153665819696,3.98739809913702,1,0.906621439832968,0.51400522),
c("GO:0008553","P-type proton-exporting \n transporter activity",0.0135318076784577,-4.32433629802825,3.31627208077668,3.59295357154787,0.5,0.810635736285948,0.53005113),
c("GO:0046912","acyltransferase, acyl groups \n converted into alkyl on transfer",0.151614298697653,6.65342736241073,2.21768887374091,4.64223692592214,0.5,0.898416349429456,0.53280308),
c("GO:0003883","CTP synthase \n activity",0.0375649339306726,-7.03376563542404,0.264961093510041,4.03630944372444,0.5,0.954752627029218,0.53312606),
c("GO:0003777","microtubule motor \n activity",0.149990205334815,-4.32366334048418,0.281175535621701,4.63755977136121,0.5,0.955823993394225,0.56463498),
c("GO:0004834","tryptophan synthase \n activity",0.0637888584638226,6.05244648630535,-3.62347208580418,4.26625522229765,1,0.927829873880017,0.57495252),
c("GO:0022804","active transmembrane \n transporter activity",2.95916376192961,-4.58787277820803,4.78459687674775,5.93265637349281,0.5,0.801349565678158,0.58414237),
c("GO:0008324","cation transmembrane \n transporter activity",2.40457734473382,-4.38380089535708,4.59824823786777,5.84252624149901,0.5,0.771662531773281,0.6046126),
c("GO:0005381","iron ion transmembrane \n transporter activity",0.0651365104031991,-3.94769447076997,4.67459996477873,4.27533439342577,0.5,0.819184366174106,0.61190417),
c("GO:0015318","inorganic molecular entity \n transmembrane transporter activity",2.92418355530831,-4.72034558963958,4.59605732288841,5.9274920100576,0.5,0.801588122499196,0.62138517),
c("GO:0005315","inorganic phosphate transmembrane \n transporter activity",0.14259539725721,-4.16698935799667,4.29163874119064,4.61560289798324,0.5,0.810052962310005,0.64854077),
c("GO:0046923","ER retention \n sequence binding",0.0136251066588761,1.69440703379216,6.84199617922705,3.59593690626917,1,0.954945793379376,0.6834754),
c("GO:0016157","sucrose synthase \n activity",0.00701124560255125,3.83965745025507,2.51531278968399,3.30749603791321,1,0.900369777710757,0.68835226),
c("GO:0022835","transmitter-gated \n channel activity",0.0621543985476044,-5.14628070444213,4.08075015378506,4.2549828788959,0.5,0.793103636497154,0.69569037),
c("GO:0008972","phosphomethylpyrimidine \n kinase activity",0.0297589192356685,6.30836851887882,0.063654309777912,3.93515444721617,0.5,0.89967932604331,0.69750179));

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
  #geom_text(aes(plot_X, plot_Y, label = description), colour = I(alpha("black", 0.85)), size = 3 ) +
  labs (y = "semantic space x", x = "semantic space y")+
  theme(legend.key = element_blank(), text = element_text(size= 15), legend.position = "none")+
  geom_text_repel(aes(label=description), size = 3, colour="black", box.padding = 0.5)



#default settings from revigo
p1 <- ggplot( data = one.data );
p1 <- p1 + geom_point( aes( plot_X, plot_Y, colour = value, size = log_size), alpha = I(0.6) ) + scale_size_area();
p1 <- p1 + scale_colour_gradientn( colours = c("blue", "green", "yellow", "red"), limits = c( min(one.data$value), 0) );
p1 <- p1 + geom_point( aes(plot_X, plot_Y, size = log_size), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) )) + scale_size_area();
p1 <- p1 + scale_size( range=c(5, 30)) + theme_bw(); # + scale_fill_gradientn(colours = heat_hcl(7), limits = c(-300, 0) );
ex <- one.data [ one.data$dispensability < 0.15, ];
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

