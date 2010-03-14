Standard REST
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

- PUT to update resource: /tickets/1.xml
- DELETE to destroy a resource: /tickets/1.xml
- Allows nested resources (e.g., /projects/1/tickets/1.xml)
