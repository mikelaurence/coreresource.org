You can add HTTP headers to any outgoing resource request by overriding the CoreResource `configureRequest:forAction:` method.
    + (void) configureRequest:(CoreRequest*)request forAction:(NSString*)action {
        [request addRequestHeader:@"Accept" value:@"application/json"];
    }