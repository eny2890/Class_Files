# Class Schedule
This will be a document that we will use as a class to keep track of what we did/are planning on doing in class, that way if you miss a session, are confused about something and want to revisit it, or didn't finish all the steps together in class, you can revisit this README file to catch up.

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


