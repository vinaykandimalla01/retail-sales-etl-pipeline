import os  
'''os is a built-in standard library module
   Think of it as a bridge between your Python code and the OS — Windows, macOS, Linux, etc.
   It’s mainly used for performing operating system–level tasks, such as:
   File and directory operations,Path manipulations,Environment variables etc'''

from kaggle.api.kaggle_api_extended import KaggleApi

'''kaggle module is the official Python client library created and maintained by Kaggle themselves
This library is the recommended and supported way to programmatically access Kaggle datasets, competitions,
 kernels, and metadata.
 
 kaggle.api is an attribute inside the kaggle Python package that holds a ready-to-use instance of the KaggleApi class
 with which you can control the kaggle 

 kaggle_api_extended is an internal Python module inside the official kaggle package.
It contains the full implementation of the KaggleApi class.
It’s where all the methods for interacting with Kaggle live — downloading datasets, listing competitions, authenticating, etc.
Use kaggle_api_extended if you want to create a fresh, customized API object yourself.

kaggleApi : This is the main class that you use totalk to Kaggle’s backend API.
Inside it, there are many methods that map directly to Kaggle actions — for example:

authenticate() → log in to your Kaggle account

dataset_download_files() → download datasets

competition_submit() → submit to a competition

kernels_push() → upload a notebook
 
 '''

source = "olistbr/brazilian-ecommerce"  # it is the dataset identifier used by Kaggle to point to a specific dataset in their platform
destination = 'D:\etl pipeline project1\datasets'# it is the place where you want to store the dataset after dowloading




def download_dataset(source,destination):   #it is function that is used to download the dataset 
    os.makedirs(destination,exist_ok=True)  
    '''os.makedirs() is a Python command that creates folders (directories) on your file system'''

    api = KaggleApi()

    api.authenticate()

    '''
 api.authenticate()

 Purpose: To verify your Kaggle account credentials and set up the API client so all future requests to Kaggle’s backend are authorized.

 How it works:

 Reads your credentials from kaggle.json (contains your username + API key).

 Verifies these credentials locally (makes sure the file exists and is correct).

 Stores them in the API client.

 Any time you call methods like dataset_download_files() or competition_submit(), the API client includes these credentials in the HTTP request headers so Kaggle’s backend knows:

 Who you are (your account)

 That you’re allowed to perform the action.
 '''

    api.dataset_download_files(source,path=destination,unzip=True)#it is a function that is used to download the datasets
    print('downloaded dataset')

if __name__ == "__main__":
    download_dataset(source,destination)
