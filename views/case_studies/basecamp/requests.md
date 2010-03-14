RESTful interface with XML.

- GET list of resources: /projects.xml
    <projects type="array">
        <project>
            <announcement>Project summary.</announcement>
            <created-on type="date">2009-11-04</created-on>
            <id type="integer">123456</id>
            <last-changed-on type="datetime">2009-11-11T23:22:55Z</last-changed-on>
            <name>Super Project</name>
            <show-announcement type="boolean">true</show-announcement>
            <show-writeboards type="boolean">true</show-writeboards>
            <start-page>log</start-page>
            <status>active</status>
            <company>
                <id type="integer">12345</id>
                <name>Super Company</name>
            </company>
        </project>
    </projects>
