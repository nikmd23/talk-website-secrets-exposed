# Azure Web Sites Secrets, Exposed
- Introduction/who I am


## Azure is Huge
- This talk is just going to aim at Web Sites and some of the nooks and crannies of that
- [What is Web Sites really?](https://github.com/projectkudu/kudu/wiki/Kudu-architecture)
	- Just IIS and Kudo
		- Prove it's ISS by doing a remote connection?
		- Prove it's Windows by RDP'ing?
	- Compare to other options?
	- *The only thing that really 'connects' the Kudu site to the real site is the file system, and that works regardless of what process or machine they each run on.*
	- Still PAAS

## Deployment is the Killer Feature
- Fast and flexible
- Customize SCM
- Customize Build
- Customize Post Deployment

## Logging
- Lots you can do
- Leverage the existing ecosystem too


---

#### Content Ideas:

1. Deployment Pipeline diagram
2. Logging 
3. Site Extensions
4. Auth/ARRAffinity?
5. REST API?


---

- Deployment - Create a diagram showing all the moving pieces? repo update -> `.deployment` -> script -> hook & post [which is mostly documented here](https://github.com/projectkudu/kudu/wiki/Customizing-deployments) with [a bit more here](https://github.com/projectkudu/kudu/wiki/Deploying-inplace-and-without-repository)
  - [Hot Swapable & Always Warm](http://weblogs.asp.net/scottgu/archive/2014/01/16/windows-azure-staging-publishing-support-for-web-sites-monitoring-improvements-hyper-v-recovery-manager-ga-and-pci-compliance.aspx)
  - Wildcards in .csproj files to get all assets
  - Custom Script
	  - Unit Tests
	  - [Multisite?](http://www.hanselman.com/blog/DeployingTWOWebsitesToWindowsAzureFromOneGitRepository.aspx) 
	  - [Is there more to `.deployment` ini looking file?](https://github.com/projectkudu/kudu/wiki/Configurable-settings)
	  - [Available variables](https://github.com/projectkudu/kudu/wiki/Deployment-hooks#environment-variables) 
	  - [File system setup](https://github.com/projectkudu/kudu/wiki/File-structure-on-azure)
  - [Configuration](http://blogs.msdn.com/b/windowsazure/archive/2014/01/28/more-to-explore-configuration-options-unlocked-in-windows-azure-web-sites.aspx) 
     - [IP restrictions](http://weblogs.asp.net/scottgu/archive/2013/09/26/windows-azure-new-virtual-machine-active-directory-multi-factor-auth-storage-web-site-and-billing-improvements.aspx) ([more](http://blogs.msdn.com/b/windowsazure/archive/2013/08/27/confirming-dynamic-ip-address-restrictions-in-windows-azure-web-sites.aspx))
     - Others?
     - [POST deployment scripts](https://github.com/projectkudu/kudu/wiki/Post-Deployment-Action-Hooks) opposed to webhook?
	     - Maybe useful to prime a cache or CDN
- Development
  - [WebJobs](https://github.com/projectkudu/kudu/wiki/Web-jobs)
     - Update Twitter feeds 
 - [ARRAffinity cookie hackery](http://blog.amitapple.com/post/2014/03/access-specific-instance/)
 - Dealing with sensitive data in source control?
 - Remote debugging
- DevOps?
	- [Credentials are confusing, there are two flavors](https://github.com/projectkudu/kudu/wiki/Deployment-credentials)
  - DNS
	  - [No WWW](http://no-www.org/)
	  - `nslookup` to demonstrate changes?
  - SSL Setup?
  - Logging
	  - Log Lizard
	  - [`AppendToLog()`](http://msdn.microsoft.com/en-us/library/system.web.httpresponse.appendtolog%28v=vs.110%29.aspx)
  - Monitoring?
  - WebHook
	  - Make Phone Ring
	  - Works with WebJobs too!
  - [Site Extensions](http://channel9.msdn.com/Shows/Web+Camps+TV/Windows-Azure-Web-Sites-Private-Site-Extensions) as well as [this](https://github.com/projectkudu/kudu/wiki/Azure-Site-Extensions) and [some samples](https://github.com/projectkudu/kudu/wiki/Xdt-transform-samples) 
	  - Little app to update the champions?
	  - At least show .scm
		  - [Console](https://github.com/projectkudu/kudu/wiki/Kudu-console)
	  - [Login trick](https://github.com/projectkudu/kudu/wiki/Accessing-the-kudu-service#simple-trick-to-avoid-manually-typing-credentials)
  - Kudo [REST API](https://github.com/projectkudu/kudu/wiki/REST-API) & Client NuGet API 
  - Endpoint Monitoring
  - AutoScale?

## check the kudo docs
## azure fridays
## amit's blog