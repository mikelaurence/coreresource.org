RESTful interface with both XML and JSON (undocumented).

- GET list of resources: /tickets.xml
- GET specific resource: /tickets/1.xml
- POST new resource: /tickets

        <ticket>
            <assigned-user-id type="integer"></assigned-user-id>
            <body></body>
            <milestone-id type="integer"></milestone-id>
            <state></state>
            <title></title>
        </ticket>
    
    Responds with HTTP status 201 created.

- PUT to update resource: /tickets/1.xml
- DELETE to destroy a resource: /tickets/1.xml
- Allows nested resources (e.g., /projects/1/tickets/1.xml)
