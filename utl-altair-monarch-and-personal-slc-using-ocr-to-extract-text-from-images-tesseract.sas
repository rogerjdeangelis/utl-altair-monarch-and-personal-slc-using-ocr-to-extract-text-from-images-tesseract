%let pgm=utl-altair-monarch-and-personal-slc-using-ocr-to-extract-text-from-images-tesseract;

%stop_submission;

Altair Monarch and personal slc ocr images extracting the text tesseract

Too ling to post in a listserve (see github)

github repository
https://github.com/rogerjdeangelis/utl-altair-monarch-and-personal-slc-using-ocr-to-extract-text-from-images-tesseract

Input png
https://github.com/rogerjdeangelis/utl-altair-monarch-and-personal-slc-using-ocr-to-extract-text-from-images-tesseract/blob/main/GSLIDE1.png

ouput text after OCR
https://github.com/rogerjdeangelis/utl-altair-monarch-and-personal-slc-using-ocr-to-extract-text-from-images-tesseract/blob/main/samplefix.txt

community.altair
https://community.altair.com/discussion/5050/what-are-the-ideal-scan-settings-to-use-with-monarch-for-pdf-data-extraction?tab=all&utm_source=community-search&utm_medium=organic-search&utm_term=monarch

 TWO SOLUTIONS
 -------------
   1 tesseract command line
     add C:/Program Files (x86)/Tesseract-OCR/tesseract to path
     Open a commad widow
     tesseract d:/png/sample.png d:/txt/sample

   2 personal slc create a png image with text
     use python image processing for a better rendition
     no errors except alignment

   3 Related repos

Where I originally got the tesseract package
https://github.com/UB-Mannheim/tesseract/wiki

There is GUI available and you get a console with both distributions.
I did not install the GUI.

Also located on my google drive
https://drive.google.com/file/d/0ByX2ii2B0Rq9MmZmVVNjLXpNdkU/view?usp=sharing

SOAPBOX ON
----------
SAS does not provide a SG replacement for proc gslide or proc gprint.

Unfortunately the personal slc has limited support
for creating image files from text.
SGPLT can to it, but you need to postition the text using x, y coordinates.

The personal Altair SLC has limited support for 'proc gslide'
It appears that many of the goptions are not supported.
For instance i could not get thes goptions to work
   reset=all
   gsfmode = replace
   gsfname = outfile.
You cannot name the image file, the slc generates gslide1.pgn..gsliden.png.
However there are ways to use 'ptoc gslide' with the personal slc.

The personal slc does not support proc gprint.

ERROR: Procedure GPRINT not known.

I could not get python stdout to work.

-----------
SOAPBOX OFF

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
This creates a png file See
*/

d:\png\gslide.png

MYSTUDY C64456                                AJAX
DRAFT                                      VER 1.6

                    Ajax Study
                Dose and Placebo

NOTEl The quick brown fox
NOTE2 jumps over a lazy dog.
NOTE3 Pack my box with
NOTE4 The order staistics are
NOTE6 lst, 2nd, 3rd, 4th, 5th
NOTE7 6th, 7th, 8th, 9th, and tenth

PGM: c:\tut\tut_g rftwowthttl .sas
OUT: c:\tut\tut_grftwowthttl.pdf


/*---- do not use &_init_                   ----*/
/*---- this code create d:/pmg/gslide1.png  ----*/
ODS HTML(ID=WBHTML) BODY=WPSWBHTM GPATH="d:\png";

goptions
   device=png
   htext=2 ;
 run;quit;

proc gslide ;

  title1 j=l  font='CONSOLAS' "MYSTUDY C04456" j=r "AJAX";
  title2 j=l  font='CONSOLAS'"DRAFT" j=r "VER 1.0";
  title3 j=l " ";
  title4 j=c font='CONSOLAS' "Ajax Study";
  title5 j=c font='CONSOLAS' "Dose and Placebo";
  note j=l "NOTE1 The quick brown fox";
  note j=l "NOTE2 jumps over a lazy dog.";
  note j=l "NOTE3 Pack my box with";
  note j=l "NOTE4 The order staistics are";
  note j=l "NOTE6 1st, 2nd, 3rd, 4th, 5th";
  note j=l "NOTE7 6th, 7th, 8th, 9th,and tenth";
  footnote1 j=l "PGM: c:\tut\tut_grftwowthttl.sas ";
  footnote2 j=l "OUT: c:\tut\tut_grftwowthttl.pdf";

 run;
 quit;
 ods html close;



/*   _                                    _      ____ _     ___
/ | | |_ ___  ___ ___  ___ _ __ __ _  ___| |_   / ___| |   |_ _|
| | | __/ _ \/ __/ __|/ _ \ `__/ _` |/ __| __| | |   | |    | |
| | | ||  __/\__ \__ \  __/ | | (_| | (__| |_  | |___| |___ | |
|_|  \__\___||___/___/\___|_|  \__,_|\___|\__|  \____|_____|___|

*/

/*---- Note tesseract adds a .txt extension   ----*/

open command window and copy the line below

> tesseract d:/png/gslide9.png d:/txt/sample

/*---- cleanup nasty consecutive '0A'x        ----*/
&_init_;
data _null_;
  infile "d:/txt/sample.txt";
  input;
  file "d:/txt/samplefix.txt";
  _infile_=tranwrd(_infile_,'0A0D'x,'0A0A'x);
  put _infile_;
run;quit;

OUTPUT
======

d:/txt/samplefix.txt

MYSTUDY C64456 AJAX
DRAFT VER 1.6

Ajax Study
Dose and Placebo

NOTEl The quick brown fox
NOTE2 jumps over a lazy dog.
NOTE3 Pack my box with

NOTE4 The order staistics are
NOTE6 lst, 2nd, 3rd, 4th, 5th
NOTE7 6th, 7th, 8th, 9th,and tenth

PG M: c:\tut\tut_g rftwowthttl .sas
OUT: c:\tut\tut_grftwowthtt|.pdf

ISSUES
  1 right and center of text is not supported
  2 Extra line between NOT3 and NOTE$
  3   x               x
    PG M: c:\tut\tut_g rftwowthttl .sas
                               x
    OUT: c:\tut\tut_grftwowthtt|.pdf

/*___                                          _       _                   _   _
|___ \   _ __   ___ _ __ ___  ___  _ __   __ _| |  ___| | ___  _ __  _   _| |_| |__   ___  _ __
  __) | | `_ \ / _ \ `__/ __|/ _ \| `_ \ / _` | | / __| |/ __|| `_ \| | | | __| `_ \ / _ \| `_ \
 / __/  | |_) |  __/ |  \__ \ (_) | | | | (_| | | \__ \ | (__ | |_) | |_| | |_| | | | (_) | | | |
|_____| | .__/ \___|_|  |___/\___/|_| |_|\__,_|_| |___/_|\___|| .__/ \__, |\__|_| |_|\___/|_| |_|
        |_|                                                   |_|    |___/
*/

&_init_;
OPTIONS NOERRORABEND;
%utlfkil(d:/txt/output.txt);
options set=PYTHONHOME "D:\python310";
proc python;
submit;
import pytesseract
import cv2
import numpy as np
import os
import sys
os.environ['TESSDATA_PREFIX'] = r"C:/Program Files (x86)/Tesseract-OCR/tessdata"
pytesseract.pytesseract.tesseract_cmd = "C:/Program Files (x86)/Tesseract-OCR/tesseract"
from PIL import Image
def url_to_image(url):
   resp = urllib.request.urlopen(url)
   image = np.asarray(bytearray(resp.read()), dtype="uint8")
   image = cv2.imdecode(image, cv2.IMREAD_COLOR)
   return image
img = cv2.imread("d:/png/gslide11.png")
retval, img = cv2.threshold(img,200,255, cv2.THRESH_BINARY)
img = cv2.resize(img,(0,0),fx=3,fy=3)
img = cv2.GaussianBlur(img,(11,11),0)
img = cv2.medianBlur(img,9)
cv2.imshow("asd",img)
cv2.waitKey(0)
cv2.destroyAllWindows()
txt = pytesseract.image_to_string(img)
print(txt)
with open("d:/txt/output.txt", "w") as f:
    old_stdout = sys.stdout
    sys.stdout = f
    print("Output redirected to file")
    sys.stdout = old_stdout

endsubmit;
run;quit;


OUTPUT
======

You need to cut and paste from "Listing for Local Server" window

MYSTUDY C04456AJAX
DRAFTVER 1.0

Ajax Study
Dose and Placebo

The PYTHON Procedure

MYSTUDY C04456 AJAX
DRAFT VER 1.0

Ajax Study
Dose and Placebo

NOTEI The quick brown fox
NOTEZ jumps over a lazy dog.
NOTEB Pack my box with

NOTE4 The order staistics are
NOTE6 lst, 2nd, 3rd, 4th, 5th
NOTE7 6th, 7th, 8th, 9th,and tenth

PGM: c:\tut\tut_grftwowthttl.sas
OUT: c:\tut\tut_grftwowthttl.pdf

/*____            _       _           _
|___ /   _ __ ___| | __ _| |_ ___  __| |  _ __ ___ _ __   ___  ___
  |_ \  | `__/ _ \ |/ _` | __/ _ \/ _` | | `__/ _ \ `_ \ / _ \/ __|
 ___) | | | |  __/ | (_| | ||  __/ (_| | | | |  __/ |_) | (_) \__ \
|____/  |_|  \___|_|\__,_|\__\___|\__,_| |_|  \___| .__/ \___/|___/
                                                  |_|
*/

REPO
------------------------------------------------------------------------------------------------------------------------------------
https://github.com/rogerjdeangelis/utl-optical-character-recognition-of-fuzzy-text-images-python-tesseract
https://github.com/rogerjdeangelis/utl-scraping-server-screens-when-Copy-Print-PageSource-are-disabled-python-tesseract
https://github.com/rogerjdeangelis/utl_using_google_tesseract_and_sas_to_convert_bmp_formatted_picture_christmas_trees_to_ascii_txt


/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
