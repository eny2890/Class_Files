# Class Schedule
This will be a document that we will use as a class to keep track of what we did/are planning on doing in class, that way if you miss a session, are confused about something and want to revisit it, or didn't finish all the steps together in class, you can revisit this README file to catch up.
## Script to attempt before class on Monday, October 14, 2024
In class we started creating a reference library for our metabarcoding project, downloading the most current taxonomy (names) from NCBI as well as FASTA files (identified sequences) from BOLD - . The last step in creating our reference library is downloading micromoth FASTA files from NCBI - . To achieve this we need to do two things - download and install an API key to our Hipergator account, then format and submit the shell script on Hipergator to download the data.
### Part 1: Downloading and Installing an API key for NCBI onto our Hipergator account
NCBI requires an API key when downloading a large amount of data onto our computer (or, in our case, our Hipergator storage). This is similar to the SSH key we created for our GitHub accounts a few weeks ago; however, it is all done on our Hipergator account, not our home directory on our computer. This API key works to tell NCBI that we have a verified account and that this is a safe place to download its data. To download and install an API key follow these steps _in order._

1.) Go to this website - https://account.ncbi.nlm.nih.gov/signup/ and sign into NCBI. Once there, your screen should look something like this.

![image](https://github.com/user-attachments/assets/f0ca9a19-9e8f-4de6-b8a4-f7221f38d9d5)

You have two options on how to sign in. You only need to do one or the other:

**Option 1**: Sign in with your Google Account.

Click the "Google Account" button. Then, NCBI will redirect you to another screen to sign in via your normal google account. Sign in using your normal google account information, and then it will redirect you back to NCBI.

![image](https://github.com/user-attachments/assets/53f05148-7d48-4310-8ffe-689a3208e285)

**Option 2:** Sign in with your University of Florida Account.

![image](https://github.com/user-attachments/assets/4887d572-f136-4cfa-9dbd-29b123a8253d)

![image](https://github.com/user-attachments/assets/22ae949e-8ecb-4cec-985a-ec1b80846b54)

2.) Go to your settings, create, and copy an API key.








1.) Logon to your Hipergator account via your computer's terminal.

#Use the ssh command and your account information

ssh YOUR_HIPERGATOR_ACCOUNT@hgp.rc.ufl.edu

2.) When you first logon, you should be in your home directory which is where you need to install your API key. But let's double check that you are there by doing this command:

#use the change directory (cd) command followed by ~, which is the code for your home directory

cd ~

3.) Next we need to make a folder in your home directory to store this API key. 

#use the make directory (mkdir) command and then the name of the directory you want. In this case we are going to name the directory .ncbi

mkdir .ncbi

#NOTE: you will not be able to see the directory .ncbi because it starts with a "." that is alright, we don't need to see it, but it is important that we name it this since ncbi will look specifically for a folder called that.

4.) Next we are going to go to NCBI 

### 
## Monday, October 7, 2024
### Goals
* Perform NCBI taxonomy dump
* Submit script for BOLD fasta download
* Set up script for NCBI fasta download (format script and download api key into directory)
### To Do before next Monday
* After you get an email that your BOLD script is done, submit the formated NCBI script (ncbi_lepidoptera_fasta_STUDENT_NAME.sh) via the sbatch SCRIPT_NAME command on hipergator

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

Bold API - https://v3.boldsystems.org/index.php/resources/api?type=webservices

List of Microlep families - https://en.wikipedia.org/wiki/Microlepidoptera

## NCBI Fasta Download

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


