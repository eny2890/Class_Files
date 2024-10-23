# Class Schedule
This will be a document that we will use as a class to keep track of what we did/are planning on doing in class, that way if you miss a session, are confused about something and want to revisit it, or didn't finish all the steps together in class, you can revisit this README file to catch up.

## Wednesday, October 23, 2024
### Goals:
* Edit and submit sequence_clean.sh script
* Open R, download data and packages into it
* Make an R package
* Download and upload data from github into R
* Brainstorm figures together for project, make a list of data needed to make figures
* Go on google scholar to look at published metabarcoding papers for figure ideas if stuck

#### Submit script for sequence cleaning

#copy the folder with today's scripts into your own folder

cp -r /blue/eny2890/share/OCT2324 /blue/eny2890/YOURFOLDER

#navigate to the new folder, make the necessary changes and submit the script

#### R Studio

#watch video explaing R studio: https://www.youtube.com/watch?v=FIrsOBy5k58

#open R studio

#make a R studio project

#practice importing data

#brainstorm figure ideas - if you are stuck go to google scholar and look around at other metabarcoding study figures

## Monday, October 21, 2024
### Goals:
* Review what has been done so far
* View FastQCs
* Combine all foward reads and reverse reads (OBIannotate_YOURNAME.sh) together
* Cut out low quality reads (obicut_YOURNAME.sh)
* Open RStudio, create project, install libraries
### After class:
* After obicut runs, edit and submit pairmatch_YOURNAME.sh
* After pairmatch runs, edit and submit cutadapt_YOURNAME.sh

#### Review 
![image](https://github.com/user-attachments/assets/b62c3517-87d7-4172-bf48-2f88daff243f)

After sequencing, all of the pooled samples were demultiplexed, or seperated by their unique barcodes. There are two files, a forward, and reverse read for each of the indivual samples we submitted.

These barcodes were used to seperate out the indivual samples from the pooled samples, and then cut off from our sequences.

Last week, we looked at the quality of each the forward and reverse reads of each of these samples. I have uploaded some of the fastqc files for us to view onto our github. Download one of the .html files onto your computure, and go to your file explorer/finder to open it and view it.

![image](https://github.com/user-attachments/assets/a3a2514c-1b34-47ec-a03c-968b29b45097)

Today, we are working on trimming out bad reads, formatting the reads for obitools, and assembling our forward and reverse paired-end reads into one large read. To do this we are using the following 4 scripts below.

#### OBIannotate
Obiannotate will take all of the individual fastq files that have already been demutiplexed, and combine all the forward reads into a single file, with the names of the individual sample annotated on it, and combine all the reverse reads into a single annotated file.

#copy the folder with today's scripts into your own folder

cp -r /blue/eny2890/share/OCT2124 /blue/eny2890/YOURFOLDER

########### OBIannotate part 2 since there was an error

cp /blue/eny2890/share/OCT2124/updated_obiannotate_YOURNAME.sh /blue/eny2890/YOURFOLDER/OCT2124

#navigate to the OCT2124, which should have the original 4 scripts as well as the new script with the error fixed

cd /blue/eny2890/YOURFOLDER/OCT2124

#to check and see if it is there use the ls (list) command

ls

#you should see 5 scripts total, including updated_obiannotate_YOURNAME.sh. Open that via nano and edit it with your information

nano updated_obiannotate_YOURNAME.sh

#change YOURFOLDER and YOUREMAIL, save the script with your name added

#submit the script via sbatch - make sure it is the edited file saved with your name

sbatch EDITED_SCRIPT

#then edit, save, and submit

#STOP HERE. Try editing and submitting this before Wednesday.

#### OBIcut - do not do, now in sequence_clean script instead
OBIcut will trim reads to a specific length that we dictate based off of the quality of the sequences we saw in the fasta files

#we did this job via sequence_clean instead

#### Pairmatch - do not do, now in sequence_clean script instead
Pairmatch joins overlapping forward and reverse reads, and saves them as a .fastq file.

#we did this job via sequence_clean instead

#### Cutadaptor - do not do, now in sequence_clean script instead
Cutadaptor will cut out the illumina adaptors added to the forward and reverse ends of our DNA before sequencing. They are what binded to the flow cell and allowed sequencing to take place. However, they are not apart of our target DNA and need to be removed.

#we did this job via sequence_clean instead

## Wednesday, October 16, 2024
### Goals:
* Edit and submit ecoPCR script
* Presentation reviewing what we did/what we are going to do today
* Edit and submit fastqc_YOURNAME.sh to run the program 
### If time/before next class:
* Install RStudio

#### Running EcoPCR
Ecopcr is an application that is a part of the OBItools pipeline. Submit the code you edited on Monday (see instructions in October 14th section) and submit that script

#### Running FastQC

#let's start by copying the script(s) from the share folder for today

navigate to your class folder in hipergator

cp /blue/eny2890/share/OCT1624/* .

#edit this script by replacing YOURNAME with your name. Similarly to what we have been doing

#save that file with your name

#submit the renamed file

#### Install RStudio

#after you are done, and BOTH jobs are submitted, install RStudio if you do not already have it

#### After doing all of this....

#while you are waiting to go over R with the rest of the class, see if you FASTQC script is done running
#if it is, view some of the fastQC files (see instructions in the screenshot below), google what each of the categories mean about our data quality. These are not our final sequences, so remember, we expect our quality to be poor

![image](https://github.com/user-attachments/assets/a7ad575b-d3d5-490c-8c08-f7a46a56aa77)

the username@remote_host is what you use to login on Hipergator (i.e. lhendrick@hpg.rc.ufl.edu) and the second pathway is to the location to where you want to save that html file. Make sure the first file pathway ends with one of the many .html files, whichever one you choose is random

then, in a terminal not connected to hipergator, do the second line of code and the Fastqc report will open in another window

## Monday, October 14, 2024
### Goals for Today:
* Make sure you have the NCBI API key installed and in the right spot in your Hipergator account (see "To Do Before Class on October 14, 2024 section" below for instructions)
* Copy, format, and submit ncbi_lepidoptera_fasta_oct1424_YOURNAME.sh
* Copy and format eco_pcr_YOURNAME.sh
### To Do after class:
* Once you receive an email that your original script, 'ncbi_lepidoptera_fasta_oct1224_YOURNAME.sh' has run, submit your already formatted script, 'ecopcr_YOURNAME.sh'

### Pulling Micro_moth data from NCBI via their API
NOTE: You must have the NCBI API key installed on your Hipergator before you begin, or this script will fail

#Logon to Hipergator
ssh YOURUSERNAME@hpg.rc.ufl.edu

#Check to make sure you have the NCBI API Key in the correct location

cd ~

cd .ncbi

ls

  #if you have the API key installed correctly you should see a file called 'api_key'
  
  #if you do not have a file called 'api_key' follow the instructions below again to install one

#navigate to class folder

cd /blue/eny2890/YOURFOLDER/REFERENCE_LIBRARY

#remove old NCBI fasta script

ls

rm ncbi_lepidoptera_fasta_STUDENT_NAME.sh

#copy new NCBI fasta script and ecoPCR script into your folder 

cp /blue/eny2890/share/OCT1424/* .

#check to see if it transferred

ls

  #now you should see two files there, "ncbi_lepidoptera_fasta_oct1424_YOURNAME.sh" and "ecopcr_YOURNAME.sh". These are the scripts we will be working with today

#edit "ncbi_lepidoptera_fasta_oct1424_YOURNAME.sh"

nano ncbi_lepidoptera_fasta_oct1424_YOURNAME.sh

  #change the email at the top to your email 
  
  #change the file pathway to your folder (i.e. replace YOURFOLDER with your folder name, which is your hipergator user account)
  
  #ctrl/X to exit, save with your name in place of YOURNAME 

#submit the script

sbatch ncbi_lepidoptera_fasta_oct1424_YOURNAME #make sure it is the edited version with your actual name!

  #wait a little bit for the email, and then make sure the script ran without any issues

### Formating ecoPCR script

#open the script in a text editor

nano ecoPCR_YOURNAME.sh

#change the file paths and the email address to your information

#save the file

#DO NOT SUBMIT YET - You will need all the fastas from NCBI and BOLD first. Wait until you get the email that your first script is finished in a few days.
#### More Resources from today's material
https://pythonhosted.org/OBITools/scripts/ecoPCR.html - ecoPCR
https://dknet.org/data/record/nlx_144509-1/RRID:SCR_016082/resolver/pdf&i=rrid:scr_016082 - ecoPCR

## Attempt this before class on Monday, October 14, 2024 
In class we started creating a reference library for our metabarcoding project, downloading the most current taxonomy (names) from NCBI as well as FASTA files (identified sequences) from BOLD - https://www.boldsystems.org/. The last step in creating our reference library is downloading micromoth FASTA files from NCBI - https://www.ncbi.nlm.nih.gov/. To achieve this we need to do two things - download and install an API key to our Hipergator account, then format and submit the shell script on Hipergator to download the data. Before class on Monday, try and install the API key so we can jump right into submitting the NCBI script during our class.
### Downloading and Installing an API key for NCBI onto our Hipergator account
NCBI requires an API key when downloading a large amount of data onto our computer (or, in our case, our Hipergator storage). This is similar to the SSH key we created for our GitHub accounts a few weeks ago; however, it is all done on our Hipergator account, not our home directory on our computer. This API key works to tell NCBI that we have a verified account and that this is a safe place to download its data. To download and install an API key follow these steps _in order._

1.) Go to this website - https://account.ncbi.nlm.nih.gov/signup/ and sign into NCBI. Once there, your screen should look something like this.

![image](https://github.com/user-attachments/assets/f0ca9a19-9e8f-4de6-b8a4-f7221f38d9d5)

You have two options on how to sign in. You only need to do one or the other:

**Option 1**: Sign in with your Google Account.

Click the "Google Account" button. Then, NCBI will redirect you to another screen to sign in via your normal google account. Sign in using your normal google account information, and then it will redirect you back to NCBI.

![image](https://github.com/user-attachments/assets/53f05148-7d48-4310-8ffe-689a3208e285)

**Option 2:** Sign in with your University of Florida Account.

Click on more sign in options on the bottom, and search for University of Florida. Click on 'University of Florida' when it comes up.

![image](https://github.com/user-attachments/assets/4887d572-f136-4cfa-9dbd-29b123a8253d)

![image](https://github.com/user-attachments/assets/22ae949e-8ecb-4cec-985a-ec1b80846b54)

After clicking on University of Florida, it will redirect you to the gatorlink screen to sign in. After you do so, you will redirect back to NCBI.

2.) Go to your account, create, and copy an API key.

After signing in, we need to go to your NCBI account settings. Click on your username in the upper right corner of the screen, and go to 'Account Settings' (see screenshots below).

![image](https://github.com/user-attachments/assets/a47896f9-0766-4f13-b818-f40dd73ee40a)

Your account settings will look like this. Look for the section called 'API Key Management' (you will probably have to scroll down to see it). Copy the string of random letters/numbers listed under the API Key column. You will need that for the next few steps. Note: Your API Key will be a different combination of numbers and letters than the one on the screenshot below, make sure you get your unique API key.

![image](https://github.com/user-attachments/assets/b86f630b-f6f0-472b-90cc-172ae5a8caf4)

3.) Logon to your Hipergator account via your computer's terminal.

#Use the ssh command and your account information

ssh YOUR_HIPERGATOR_ACCOUNT@hgp.rc.ufl.edu

4.) When you first logon, you should be in your home directory which is where you need to install your API key. But let's double check that you are there by doing this command:

#use the change directory (cd) command followed by ~, which is the code for your home directory

cd ~

5.) Next we need to make a folder in your home directory to store this API key. 

#use the make directory (mkdir) command and then the name of the directory you want. In this case we are going to name the directory .ncbi

mkdir .ncbi

#NOTE: you will not be able to see the directory .ncbi because it starts with a "." that is alright, we don't need to see it, but it is important that we name it this since ncbi will look specifically for a folder called that.

4.) Make a file called 'api_key' with your API key pasted into it.

#First, lets move into our directory '.ncbi' by typing the command change directory, followed by .ncbi

cd .ncbi

#now let's create a text document called 'api_key' using our bash text editor, nano

nano api_key

Note: Remember to use an _ and no spaces when naming text files

This command should have opened up a blank text file. Paste the API key that you copied in step 2 into your terminal. If you are having trouble pasting, try right-clicking. It will look something like the picture below.

![image](https://github.com/user-attachments/assets/01271a1c-1ec2-4360-bdb9-ff989a0339af)

Exit from nano by hitting ctrl/x, hit y then enter to save it with the name 'api_key'

Now you have your API key ready and will be able to edit and submit the script on Monday as a class!

## Monday, October 7, 2024
### Goals
* Perform NCBI taxonomy dump
* Submit script for BOLD fasta download

#### Notes and Code we used from class today

In today's class, we are going to set up the taxonomic and sequence reference libraries that OBITools, the pipeline we are using to identify the taxa (a generic term for any taxonomical group i.e. species, genera, family, superfamily, etc) by matching our sequence data to.

Note: The database we are generating today is giant, and will be very general - i.e. it contains sequences of microleps from all over the world, not just the US or Florida. It also will contain potentially messy, uncurated sequence data from NCBI. If your group is still looking for a question and finds working with APIs fun, you could potentially as a research question on changing our reference library (i.e. only include well-curated data from BOLD and NCBI, or limiting your sequences to only data from Florida/USA) and see how that impacts our results. 

# OBITools Overview

![image](https://github.com/user-attachments/assets/aeff9db6-518e-4884-b6d2-ec4390800b8a)

Today, we are focusing on generating the NCBI Taxonomy via taxdump, and collecting the reference sequences of already known and identified microleps via NCBI and BOLD's APIs.

APIs (Application based programming interfaces) is a general term for an interface that allows software programs to interact and download or share information with each other. Today, we are using APIs to download taxonomic and sequence data into our terminal. The bash command for commuinicating with an api is wget, although other commands (such as esearch for NCBI) exist via different applications. 

Working with APIs is a  common skill in computer sciences and bioinformatics, and is a skill that you can add to your resume after this class! If you find this fun, you can google other website's APIs and play with downloading and manipulating data via your own terminal (i.e. on your terminal without logging in on hipergator). More APIs (with much more fun data) can be found here: 
https://medium.com/codex/15-fun-and-interesting-apis-to-use-for-your-next-coding-project-in-2022-86a4ff3a2742

## Using taxdump to download current NCBI Taxonomy

#Logon to hipergator 
ssh <YOUR_USERNAME>@hpg.rc.ufl.edu

#Navigate to the class folder 
cd /blue/eny2890

#move into your specific folder
cd <your_username>/
  #remember, you can autocomplete this by starting to type your username, then autocompleting it by pushing tab, then enter

#in your folder make a directory called REFERENCE_LIBRARY
mkdir REFERENCE_LIBRARY

#now we are going to copy data from the share folder into your newly created folder
cp /blue/eny2890/share/REFERENCE_LIBRARY/* .

#Now you should have 3 different files that all end in .sh, which stands for shell script. We will be using each of them today, starting with ncbi_taxonomydump_STUDENT_NAME.sh

#open ncbi_taxonomydump_STUDENT_NAME.sh with nano
nano ncbi_taxonomydump_STUDENT_NAME.sh
   #Edit this script with your email and correct file pathway
   #Save it with your name in place of student name

#Detour to look at applications on hipergator: https://help.rc.ufl.edu/doc/Applications

#After editing, submit this script to hipergator
sbatch ncbi_taxonomydump_<YOUR_NAME>.sh 

#check to see if its running 
squeue --me

At the end of this we will have a taxonomy database that obitools can use!

## BOLD FASTA Download

#in your folder there should be a file called "bold_lepidoptera_fasta_STUDENT_NAME.sh"

#open that folder using nano

nano bold_lepidoptera_fasta_STUDENT_NAME.sh

#change the email at the top to yours, and change the folder names to yours
#the last line at the top that starts with #, remove the -b at the end of 
#ctrl/x to exit, save it with your name in place of STUDNET_NAME

#submit

#edit this script in three lcoations 

### Resources on BOLD Dowload
Bold API - https://v3.boldsystems.org/index.php/resources/api?type=webservices

List of Microlep families - https://en.wikipedia.org/wiki/Microlepidoptera

# More resources on today's material (Optional)
 Obitool background - https://pythonhosted.org/OBITools/welcome.html

 API background - https://aws.amazon.com/what-is/api/#:~:text=APIs%20are%20mechanisms%20that%20enable,use%20Simple%20Object%20Access%20Protocol., https://www.ibm.com/topics/api

 NCBI Taxonomy Dump - https://www.ncbi.nlm.nih.gov/guide/taxonomy/

 NCBI API Key How to - https://support.nlm.nih.gov/kbArticle/?pn=KA-05317
 
## Wednesday, September 25, 2024
### Goals
* Join our Github Classroom (give me your username if you have not already)
* View our classroom and our repositories
* Review Monday's material
* Set up 2fa in git (via settings)
* Go over Hipergator Github training: https://ufresearchcomputing.github.io/git-training/
* Download Git to our personal computers (instructions via training and video listed in resources)
* Set up our SSH key in git - https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent, https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
* Each group make a group repository
#### If Time
* Look over and discussed the obitools metabarcoding tutorial: https://training.galaxyproject.org/training-material/topics/ecology/tutorials/Obitools-metabarcoding/tutorial.html
* Viewed general OBItools workflow: https://training.galaxyproject.org/training-material/topics/ecology/tutorials/Obitools-metabarcoding/tutorial.html 
* Discussed alternative metabarcoding bioinformatic pipelines (Qiime2 - https://docs.qiime2.org/2024.5/tutorials/index.html, MBrave -http://mbrave.net/)

#### Notes and Code we used from Class Today
Mac users - install github via homebrew
Windows users use link from hipergator tutorial on git

#### More Resources on Today's Materials (OPTIONAL)
Downloading and using GIT on your computer - https://www.youtube.com/watch?v=r8jQ9hVA2qs

Hipergator GIT practice - https://github.com/UFResearchComputing/git-training 

## Monday, September 23, 2024
### Goals
* Logon to Hipergator - on terminal ssh username@hpg.rc.ufl.edu
* Practice Bash
* Submit first SLURM script
* Make Github accounts

#### More Resources on Today's Material (OPTIONAL)
BASH commands - https://www.educative.io/blog/bash-shell-command-cheat-sheet

SLURM for hipergator - https://help.rc.ufl.edu/doc/SLURM_Commands

General information about SLURM - https://blog.ronin.cloud/slurm-intro/

#### Code we used in class today (Copied from my terminal)
#Today, everything we did was using BASH on Hipergator, or submitting a job to hipergator using SLURM
#Make sure that we are not running anything or saving resources in our home directory (~), because there are no hipergator resources there, and a very small amount of storage

#The first thing to every Hipergator session should start with the following line of code to change directory to our class folder following the directory /blue/eny2890
cd /blue/eny2890

#navigate to your specific class folder using the cd command followed by your folder name
#you can speed up this process by typing the first few letters of your folder and hitting the tab button to autofill, or at least show the folders that start with what you have typed

cd yourfolder/

#made sure we were in the correct directory using the pwd, which prints our working directory (where we currently are at)

pwd

#should say /blue/eny2890/your_directory

#to make a directory use the mkdir command followed by the name you would like to call it

mkdir gonna_delete

#Note: When naming anything in hipergator, avoid spaces. If you want to use a space, use the _ in place of it. If you accidentally use a space, then the computer will think its two separate folders or whatever you are making. Also avoid special characters (i.e. &*+@!, etc), either they have another meaning in BASH or the computer won't be able to read it

#moved to directory gonna_delete

cd gonna_delete

#use nano to create and edit a file in BASH

nano test

#we wrote in this file, and when exiting following the prompts on the bottom (Ctrl+X, Y, new name, Y) we renamed the file as test.txt because it just contained text and is a text file, which at the end should have the .txt

#now we removed our file

rm test.txt

#and removed our folder

rm -r gonna_delete

#we add the r, called a recursive command, to tell the computer it is okay to remove the directory (aka the folder)

#we used the ls command to list the contents of our folder, which should now be empty

ls

#we copied a file from the share folder which was an empty SLURM script

cp ../share/SLURM.sh .

#the ../ means one folder above where we currently are (aka our working directory) and the . tells the computer we want that document to go here

#using nano, we edited the SLURM script template with our email address, renamed the outfile and the job name to something relevant to the job (aka what we are asking hipergator to do) and added a BASH code underneath to tell the Hipergator to do something. and resaved it as hello_world.sh. The .sh tells the computer that this file is a shell script, which can be submitted to hipergator

#code we added to the slurm script

echo "Hello world I am running on $HOSTNAME"
sleep 30 
date

#submitted the edited slurm script to Hipergator using this code

sbatch hello_world.sh

#checked to see if the job ran

squeue --me 

#after running we viewed the outfile to see if it correctly ran

#### To Do For Next Class
Make github account using ufl email; submit username via assignment on canvas

See "Papers" folder in this repository for PDFs on OBITools (Boyer et al 2015) and general metabarcoding workflow for entomologists (Liu et al 2020)

#### To Do For Next Class


