Basic authentication is handled natively by the [ASIHTTPRequest library](http://allseeing-i.com/ASIHTTPRequest/); since Core Resource's requests are merely subclasses of ASIHTTPRequest, all you have to do is configure them before they go out. You can do so by overriding the `configureRequest:forAction:` method in CoreResource.
    + (void) configureRequest:(CoreRequest*)request forAction:(NSString*)action {
        [request setUsername:@"username"];
        [request setPassword:@"password"];
    }
Read more about ASIHTTPRequest's authentication abilities in its [Handling authentication](http://allseeing-i.com/ASIHTTPRequest/How-to-use) documentation.