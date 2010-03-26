Only three weeks are left before Core Resource's targeted April 15th beta release, so I thought I'd give a rundown of what's left. You can get a detailed overview by looking at the [Beta milestone](http://coreresource.lighthouseapp.com/projects/48029-core-resource/milestones/current), but in summary: 

- Remote creates, updates, and deletes
- Customizable REST methods
- XML serialization/deserialization

I'd also like to address a few questions & comments (most notably by Luke Redpath in his [article on synching web services with Core Data](http://lukeredpath.co.uk/blog/synching-web-services-with-core-data.html)).

First, I'd like to stress that Core Resource is not a library - it's a *framework*. Its stated goal is to provide "local & remote resource management for Objective-C in as little code as possible." In order to provide a high level of efficiency, Core Resource will prefer certain conventions and dependencies, and it will contain more tools than you necessarily need to get the job done. But it is meant to be a single point of entry for building resource-based applications, removing the headaches caused by integrating several disparate libraries.  

##### Regarding the architecture of the framework, why depend on inheritance to provide functionality?

Core Resource's dependency on inheritance is partly an artifact of agile development. I've always planned to move towards a decoupled model, but I decided early on that it was best to have the experience of using the framework against several different APIs (hence the new "Case Studies" section on the website) before making any grand architectural decisions.

That said, using some level of inheritance is a no-brainer when working with Core Data, as all model classes *must* inherit from NSManagedObject, so inserting another subclass into that chain does not create any additional types of dependency. What it does do is open up a direct line to CoreResource's functionality, enabling friendly code like `[Artist findAll]` instead of passing entities and such around.

##### But what if I want to utilize Core Resource functionality with non-managed objects?

Many of Core Resource's components are currently undergoing modularization, which will allow you to break free of Core Data should you wish. The syntax is still under consideration, but I hope to have it all taken care of by the beta release.  

##### Core Resource seems targeted towards RESTful services. Can it work with other protocols?

Sure, but it may take a little more work. As mentioned, a decoupling refactor is underway, so you should soon be able to deal in arbitrary URLs and request processing with more freedom.


