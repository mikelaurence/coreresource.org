Only three weeks are left before Core Resource's April 15th beta release, so I thought I'd give a rundown of what's left. I'll also try to address a few architecture questions that have been thrown my way (most notably by Luke Redpath in his [informative article on synching web services with Core Data](http://lukeredpath.co.uk/blog/synching-web-services-with-core-data.html)).

### What necessary functionality is still unimplemented?



### Why depend on inheritance to provide functionality?

Core Resource's dependency on inheritance is an artifact of agile development. I've always planned to move towards a decoupled model, but I decided early on that it was best to have the experience of using the framework against several different APIs (hence the new "Case Studies" section on the website) before making any grand architectural decisions.

That said, using some level of inheritance is a no-brainer when working with Core Data, as all models *must* inherit from NSManagedObject, so inserting another subclass into that chain has no serious ramifications. Certainly all Core Data models can benefit from the wrapper methods that Core Resource provides (do you really want to create and perform fetch requests by hand when you can just find:?)

### So what kind of decoupling is planned?

Enough to allow you to run requests against the CoreResource class without subclassing. The architecture will probably be similar to HTTPRiot, where you can run static methods against HRRestModel or subclass it to gain some automatic configuration. Some other methods will become more independent, as well. For example, sometimes you want to generate dictionaries or simple objects from a request instead of managed objects (such as in a search request, whose results you don't care to save); I'm hoping to have a clean way to implement that kind of behavior with the Core Resource beta release.

### Core Resource seems targeted towards RESTful services. Can it work with other protocols?

Sure, but it may take a little more work. As mentioned, a decoupling refactor is underway, so you should soon be able to deal in arbitrary URLs and request processing in a more modular fashion.

### Why include CoreTableController and other non-syncing related features in the framework?

It's important to note that Core Resource is not a library - it's a framework, one intended to provide "local & remote resource management for Objective-C in as little code as possible." That includes whatever bits of code are often duplicated in pursuit of that stated goal. Of course, you can use the synching subset of Core Resource and ignore the rest if you prefer.

More separation between functional components will probably creep in at some point (much like how ObjectiveResource has its ObjectiveSupport dependency). But "Core Resource" is intended to be the umbrella project. You won't be seeing "CoreSupport", "CoreController", etc. The Rails puns need to stop at some point, don't they?