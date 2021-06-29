#### DRAW_FORMANT_PLOT_FROM_TABLE.PRAAT
#### AUTHOR: KRISTINE YU, Time-stamp: <2010-11-11 22:13:27 amoebe>
#### LING 104, FALL 2010 JUN/YU, LAB 2: VOWEL FORMANTS
#### PURPOSE: DRAW FORMANT PLOT FROM TABLE GENERATED FROM collect_formant_data_from_files.praat, (the version edited by Kristine Yu to work with point tiers)
#### Assumes formant table is already open in Praat

form Draw formant plot from text file of formant values
	comment Formant textfile name
	text formant_file formant_log
#	comment Full path of the image file:
#	text resultfile /Users/amoebe/desk/test/formantplot.eps
	comment Column name for vowel label:
        text col_vowel Vowel
	comment Vowel label:
        text type_vowel
	boolean Plot_F1 1
	boolean Plot_F2 1
	boolean Plot_F3 0
	comment Font size:
	positive font_size 12
	positive f1_lo 200
	positive f1_hi 900
	positive f2_lo 600
	positive f2_hi 2500
	positive f3_lo 800
	positive f3_hi 5000
	comment Standard deviation for ellipse:
	positive stdev 2
endform

## Open formant text file
#Read from file... 'formant_file$'
## Assume formant table is selected
## Select formants file
select Table 'formant_file$'

## Extract subtables for vowel type
Extract rows where column (text)... 'col_vowel$' "is equal to" 'type_vowel$'

## Select outer bounds for plot window
Select outer viewport... 0 5 0 4

# Draw scatterplot for vowel
if plot_F1 = 1 and plot_F2 = 1
   Scatter plot... F2 f2_hi f2_lo F1 f1_hi f1_lo 'col_vowel$' font_size no
   Text right... yes F1
   Text top... yes F2
elsif plot_F1 = 1 and plot_F3 = 1
   Scatter plot... F3 f3_hi f3_lo F1 f1_hi f1_lo 'col_vowel$' font_size no
   Text right... yes F1
   Text top... yes F3
elsif plot_F2 = 1 and plot_F3 = 1
   Scatter plot... F3 f3_hi f3_lo F2 f2_hi f2_lo 'col_vowel$' font_size no
   Text right... yes F2
   Text top... yes F3
endif

# Garnish plot
Draw inner box
Marks right... 5 yes yes yes
Marks top... 5 yes yes yes

# Draw ellipses
if plot_F1 = 1 and plot_F2 = 1
   Draw ellipse (standard deviation)... F2 f2_hi f2_lo F1 f1_hi f1_lo stdev no

elsif plot_F1 = 1 and plot_F3 = 1
   Draw ellipse (standard deviation)... F3 f3_hi f3_lo F1 f1_hi f1_lo stdev no
elsif plot_F2 = 1 and plot_F3 = 1
   Draw ellipse (standard deviation)... F3 f3_hi f3_lo F2 f2_hi f2_lo stdev no
endif



