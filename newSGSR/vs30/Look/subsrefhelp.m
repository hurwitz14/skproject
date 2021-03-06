% DATASET SUBSCRIPTED REFERENCE
%
%  Below is a list of allowed fields, their contents, 
%  and a sample value if relevant. DS is a dataset object.
%  DS.name/name2 means: DS.name1 or, equivalently, DS.name2.
%  The fields are case insensitive.
%
%  See also RAS and RATE for straightforward usage of datasets.
%
%  Syntax                Meaning                  Sample value
%  -----------------------------------------------------------
%  -----------------------------------------------------------
%  DS.help            Shows this help text
%  -----------------------------------------------------------
%  DS.id              Struct containing ID info
%  DS.filename        Raw data filename           A0128
%  DS.fileformat      Raw data format             IDF/SPK or SGSR
%  DS.seqid/condid    Unique identifier           <NSPL-35-4-A+>
%  DS.iseq            Seq # in data file          35
%  DS.stimtype        Stimulus menu               NSPL
%  DS.icell           Cell number                 4
%  DS.time            Date/time vector            [11 2 2002 21 34 44]
%  DS.place           Lab and PC                  Leuven/Bigscreen
%  DS.title           Quick plot title            D0209a  <17-6-NSPL-A->
%  -----------------------------------------------------------
%  DS.sizes           Struct containing Nsub, etc
%  DS.nsub/ncond      # conditions (=subsequences)
%  DS.nsubrecorded/nrec # recorded conditions   
%  DS.nrep/nrun       # repetitions (=runs)
%  -----------------------------------------------------------
%  DS.data            Struct containing all raw data
%  DS.spiketimes/spt  Spike times in Nsub x Nrep cell array
%  DS.otherdata       Exceptional raw data (e.g. THR curve)
%  DS.settings        Settings of stimulus program
%  DS.session         Session info
%  DS.recordparams/recparam ...
%                     Recording parameters 
%  -----------------------------------------------------------
%  DS.stimulus/stim   Struct contaning stimulus info
%  DS.indep/indepvar/x Struct containing info about ...
%                     ... independent variable
%  DS.indepunit/xunit Unit of indep variable         dB SPL
%  DS.indepname/xname Name of indep variable         Level
%  DS.indepval/xval   Values of indep var in ...
%                      .. order of presentation
%  DS.indeplabel/xlabel Plot label for indep-var     Level (dB SPL)
%  DS.indepshortname/xshortname ...
%               Compact version (no spaces) of DS.Name
%  DS.indepscale/xscale Log/Lin indep axes           Linear
%  DS.special         Special stim params in Struct
%  DS.repdur          Duration of repetition in ms
%  DS.burstdur        Duration of burst in ms
%  DS.carfreq/fcar    Carrier freq (in Hz) if applicable
%  DS.modfreq/fmod    Modulation freq (in Hz) if applicable
%  DS.beatfreq/fbeat  Beat freq in (in Hz) applicable
%  DS.beatmodfreq/fbeatmod ...
%                     Modulation Beat freq in (in Hz) applicable
%  DS.dachan/chan/activechan ...
%                     Active DA channel (0,1,2 = Both,Left,Right)
%  DS.stimparam/param/spar ...
%                     Detailed stimulus parameters
%
%  DS.XXX, where XXX is an existing field of DS.spar accesses that
%   field directly












