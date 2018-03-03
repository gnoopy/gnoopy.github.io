---
title: Blog on github with Jekyll
layout: post_page
---

There might be someone who want simpler blog than Wordpress. This is what you are experiencing the neat blog. You can host your blog on pages.github.com with Jekyll.  To use this platform, you must be a devloper who is familiar with git, web service, markdown and ruby.  It seems that github pages with Jekyll is not convenient and it is true because you have to manage install jekyll, theme, upload contents to github by using git command. The main reason I decided to go with Jekyll is the freedom from  monthly expense to activate SEO on my blog.

If you check the price policy of wordpress, you will notice that it takes USD 25 per month for SEO tool. If you are a developer you might be able to save this and handle it easily.



<img src="../../../../img/wordpress-price.png" width="600px" />



My recent vacant experiece in development and engineering field made me feel timidity to play aroud with Jekyll so that it took two days to have full understand on it.

Please don't be afraid and just try to use it. there are a lot of useful blog articles for this. Today I just leave what would be the important steps you have to overcome to make everything work.

1.  Create github account and repository to enable github pages for your blog.
2.  Download and Install Jekyll on your eve environment
3.  Be familiar with rvm execution environemtnt. If you face some error related to rvm , gem or ruby version, don't give up and search them. Please remember this shell command  "**use rvm 2.4.2**"  and put it in you .bashrc or .bash_profile
4.  If your Jekyll works,  apply any theme on your environment after finding out on the internet. Also remember this command "**bundle install**" when you apply all files from theme template to your working directory.
5.  Install jekyll-admin plugin and push all files generated from this procedures to your github pages. 
6.  For your information jekyll-admin is not working on github but on your local environment.
7.  write post on your local jekyll server with jekyll-admin and push it to your github pages.