  1. Get from SCM
  2. Build/Copy
  3. AfterScripts/WebHooks


sdf


  1. If there's a .deployment file at the root of the repository go to step 4, otherwise go to the next step.
  2. Scan for solution files, if there's multiple solutions, fail, if there's 1 solution file go to next step, if none, go to step 6.
  3. Now that we have a solution, pick the first website or WAP in that solution and deploy it, if there's none, then fail.
  4. Find the target project file, if there's multiple projects, fail, if there's 1 project file, deploy it, otherwise go to next step.
  5. look for a website project in the specified folder (by finding a solution that has a website with the same path), if more than one, fail, otherwise deploy the website project.
  6. Find the target WAP, if there's none then Xcopy deploy all the repository files (excluding .git and .hg) to the web root.


`/.deployment` (`.ini` format) OR App Settings

```ini
[config]
; full path to the project file to be built (ASP.NET) or directory
project = WebProject/WebProject.csproj

; commands to add at the end of the msbuild.exe command line
SCM_BUILD_ARGS=-p:Configuration=Debug


; override the arguments send to the deployment script
SCM_SCRIPT_GENERATOR_ARGS=--basic -p FolderToDeploy

; update submodules before doing a deployment. default is 1 (On)
SCM_DISABLE_SUBMODULES=1

; enable git clone --depth 1. default is 0 (Off)
SCM_USE_SHALLOW_CLONE=1

; post deplyment script directory. default is '/site/deployments/tools'
SCM_POST_DEPLOYMENT_ACTIONS_PATH=<path> 

; trace level. default is 1
SCM_TRACE_LEVEL=4

; timeout, per command, in seconds. default is 60
SCM_COMMAND_IDLE_TIMEOUT=600

; log streaming inactivity timeout, in seconds. default is 1800
SCM_LOGSTREAM_TIMEOUT=900

; these only work in App Settings

; the version of Node that is used by default
WEBSITE_NODE_DEFAULT_VERSION=0.10.5

WEBSITE_PRIVATE_EXTENSIONS=1

; the name of the file where internal errors are logged, for troubleshooting the listener
DIAGNOSTICS_LASTRESORTFILE=logging-errors.txt

; the settings file, relative to the web app root
DIAGNOSTICS_LOGGINGSETTINGSFILE=..\diagnostics\settings.json

; the log folder, relative to the web app root
DIAGNOSTICS_TEXTTRACELOGDIRECTORY=..\..\LogFiles\Application

; maximum size of the log file. default is 128 kb
DIAGNOSTICS_TEXTTRACEMAXLOGFILESIZEBYTES=200000

; vaximum size of the log folder. default is 1 MB
DIAGNOSTICS_TEXTTRACEMAXLOGFOLDERSIZEBYTES=2000000

WEBSITE_USE_HOME_SITE_PATH=0
```

