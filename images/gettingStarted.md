## Getting Started With Your Group

Receiving a project with a broad range of deliverables can be overwhelming. Where do you start? This can be especially tricky when working in a group. People have different views on how to approach problems as well as expectations of the end product. Your first hurdle is coming up with an idea to build your project around. It is key that you choose something that is not only feasible in the allotted time frame, but also is engaging to all the members of your group. For this project the instructors and TA's will be acting as project managers. They will assist each group, providing technical guidance as well as getting you properly launched on an idea we deem feasible. If approached correctly this will be your first "full stack" application for your portfolio.

The design of your mySQL backend will directly effect what you are able to accomplish in terms of features for this project. It is imperative that you have this working before you move forward with the apps functionality. Get the schema designed and build the database tables before creating appropriate Java classes, and annotating them with JPA.

### Creating your project
**A SINGLE GROUP MEMBER - THE TEAM'S REPO OWNER - SHOULD DO THE FOLLOWING STEPS**

#### Workspace Folder and Git Setup

1. Create a workspace for the project:
   ```bash
   mkdir ~/SD/Java/MidtermProject
   ```

1. Create a `.gitignore`:
   ```bash
   cd ~/SD/Java/MidtermProject/
   subl .gitignore
   ```

   ```
   .DS_Store
   Servers
   target
   build
   bin
   default
   .metadata
   .settings
   .gradle
   *.war
   *.bak
   ```

1. Create a Github repository named **MidtermProject**.

   * Copy the repository initialization commands from the repo page and run them in your _~/SD/Java/MidtermProject/_ folder.

   * Do another `git add .` and a `git commit -m "Add .gitignore"`.

1. Invite your other team members to collaborate on the repo.

   * Navigate to `Settings/Collaborators` and enter their usernames in the provided form.  

#### Project Workspace Setup

1. In STS, use _File_ | _Open Workspace_ to open your _MidtermProject_ folder while also leaving _VideoStore_ open for reference.

1. In the STS _Preferences_, change the following settings:

   * **Gradle**: **`Specific Gradle version`** (current latest version)
   * **Run/Debug** | **Console**: UN-check _Limit console output_.
   * **General** | **Workspace**: _Show full workspace path_
   * **Apply and Close**

#### JPA Project Setup

##### Setup a JPA project for your JPA entity(s) and tests.

1. Create a new **JPA Project** with an appropriate name.
   1. Add new source folders to the build path:
      * `src/main/resources`
      * `src/test/java`
      * `src/test/resources`
   1. Under _JPA implementation_, choose **Disable Library Configuration**
   1. Do NOT open the JPA perspective.
1. Move the `META-INF` folder from `src/main/java` to `src/main/resources`.

##### Configure Gradle

1. Add Gradle Nature to the project.
1. Open the _Gradle Tasks_ view.
1. Under the `build setup` task group, run the `init` task.
1. Go to the _Console_ view and press _Return_ to answer the required questions until you get `BUILD SUCCESSFUL`.
1. Refresh the _Package Explorer_ view to see the new gradle files.
1. Copy the contents of the `build.gradle` from the **JPAVideoStore** project into your new project's `build.gradle`; save and **Gradle Refresh**.

#### Configure the JPA Persistence Unit

1. Copy the `log4j2.properties` file from **JPAVideoStore** into your new project's `src/main/resources` and `src/test/resources` folders.
1. From the **JPAVideoStore** `persistence.xml` copy the contents from between the `<persistence-unit>` tags (not the whole file) into your new project's `persistence.xml`, between the opening and closing `<persistence-unit>` tags.
1. Change the schema name in the JDBC URL to a visible placeholder value, like `FIXME`.
1. Set the values for user and password to the same placeholder.
1. Include one `<class>` declaration with a base package name appropriate for your project, in the sub-package `entities`; the entity class name will be `User`.
1. Create the entity class under `src/main/java` in the specified package.  Leave the entity class empty.
1. Under `src/test/java` create the same package name and add a `UserTest` JUnit test case with all setups and teardowns.  Leave it empty otherwise.

### Create a Spring Boot Project for your MVC controllers, DAOs, DAO implementations, and JSP views.

1. Copy the base package name from your entity class (the package name up to but not including `.entities`)
1. Create a new _Spring Starter Project_.
1. Paste the base package name into the _Package_ field.
1. Give the project an appropriate name (this project name will appear in the URL once you deploy the project.)
1. Set the _Type_ to **Gradle - Groovy**
1. Set the _Packaging_ to **War**
1. Add the _Spring Web_, _Spring Data JPA_, and _MySQL Driver_ dependencies.

1. Add JSP dependencies to the `dependencies` block in the Boot project's `build.gradle`:

   ```
       implementation group: 'jakarta.servlet.jsp.jstl', name: 'jakarta.servlet.jsp.jstl-api', version: '3.0.0'
       implementation 'org.glassfish.web:jakarta.servlet.jsp.jstl:3.0.0'
       compileOnly group: 'jakarta.servlet', name: 'jakarta.servlet-api', version: '6.0.0' 
       implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
       implementation 'org.glassfish.expressly:expressly:6.0.0-M1'
   ```

   Add above `repositories`:

   ```groovy
   eclipse.wtp.facet {
      facet name: 'jst.web', version: '6.0'
   }
   ```

1. Connect the projects using your Boot project's `settings.gradle` and `build.gradle`.

1. Do a Gradle refresh.

1. Update the Boot project's `application.properties` using the one from the _BootMVCVideoStore_ application.

   * Change the schema name in the datasource URL, the username, and the password to the placeholder you used in `persistence.xml`.

1. Under `src/main` create `webapp/WEB-INF/` for your JSPs.  Static content (HTML, CSS, image files) will go in `src/main/webapp/`.

   * Add a `home.jsp` in `webapp/WEB-INF/`.

1. Create packages for your controller and DAO, and get a basic controller route and JSP view working.

   * Add a `UserDAO` interface and a `UserDaoImpl` implementation class.

     * Annotate the `UserDaoImpl` with `@Service` and `@Transactional`.

     * Autowire an `EntityManager` field using `@PersistenceContext`.

   * Add a `UserController`.

     * Annotate the class with `@Controller`, and autowire a `UserDAO` field.

1. Add, commit, and push the project to the remote repo.

### Synchronize environments between team members:

**THESE STEPS ARE FOR THE REMAINING MEMBERS OF THE GROUP THAT DID NOT CARRY OUT THE STEPS ABOVE**
**THEY ARE ALSO PREDICATED ON THE FACT THAT YOU HAVE ALREADY CONFIGURED GRADLE**

#### Clone the Project Repository
* Accept the invitation to the repo owner's repository.

  * You will need to get the URL from the GitHub repo that was created by your group mate.  

  * Cloning creates a folder with the content from the GitHub repo.  
* Clone the repository to your `~/SD/Java/` folder.

#### Configure the Workspace

* Open the workspace folder with STS, leaving the _VideoStore_ workspace open for reference. Choose `File/Switch Workspace/Other` and navigate to the location you cloned the repo. Open that folder as a workspace.

1. In STS, use _File_ | _Open Workspace_ to open your _MidtermProject_ folder while also leaving _VideoStore_ open for reference.

1. In the STS _Preferences_, change the following settings:

   * **Gradle**: **`Specific Gradle version`** (current latest version)
   * **Run/Debug** | **Console**: UN-check _Limit console output_.
   * **General** | **Workspace**: _Show full workspace path_
   * **Apply and Close**

#### Import the Projects
* The workspace will not be populated with the projects at this point. We need to manually import them.
1. In STS choose `File`/`Import`/`Gradle`/`Existing Gradle Project` and click next.
1. Find the cloned git repo in the browse feature. Select the _Spring Boot_ project folder to import. Because you already did the Gradle config, the JPA project will automatically be brought in as a sub dependency.
1. Click Finish
1. Once the projects have imported, do a Gradle refresh of the boot project.

**THESE STEPS ARE FOR THE PROJECT DBA**

### Database Schema Initialization

#### Create a MySQL Workbench Schema Model
1. In a terminal, `cd` to your cloned `~/SD/Java/MidtermProject` folder.
1. Create a folder for the team's database files:
   ```bash
   mkdir DB
   ```
1. If you haven't already started one, create a new Model in MySQL.  Save the `.mwb` file to the `~/SD/Java/MidtermProject/DB/` folder.

1. In the _Model_ tab under _Physical Schemas_, set the schema name to something appropriate for your project and easy to remember.
1. Under _Schema Privileges_ create a username (with `@localhost`) and set the password.
1. Add the `table.modify` role to the user.

#### Stub the user table
1. Create an EER diagram (if you don't have one) and in the diagram add a `user` table with the following columns:

   ```
   id INTEGER PRIMARY KEY AUTO_INCREMENT
   username VARCHAR NOT NULL UNIQUE
   password VARCHAR NOT NULL
   enabled BOOLEAN (TINYINT)
   role VARCHAR
   ```
1. In the _Inserts_ tab, add a record with id `1` and `username` and `password` values; set `enabled` to ` (true).

1. Forward engineer the schema, resolving any errors until successful.
1. After successfully forward-engineering, go back to the script page and save the forward-engineer `.sql` script to the `~/SD/Java/MidtermProject/DB/` folder with an appropriate name.

#### Configure the Persistence Unit
1. In the JPA project's `persistence.xml` replace the placeholders for schema name (in the url), user, and password with the values you created in the schema model.

1. In the Spring Boot project's `application.properties` file do the same.

#### Stub and test the entity.
1. In the JPA project open the `User` class.
1. Add fields for `id` and `username` (no more for now) and generate ctor, gets/sets, etc.
1. Annotate the class as an entity.
1. Complete the `UserTest` and get it to pass.

1. Add, commit, and push the project to the repo.

**THESE STEPS ARE FOR THE NON-DBA TEAM MEMBERS**
1. In your `~/SD/Java/MidtermProject/` folder, do a git pull.
1. Run the `.sql` script to load the database into your mysql.
   ```bash
   ls DB/
   mysql -u root -p < DB/scriptName.sql
   ```
1. In STS, do a Gradle refresh of the Spring Boot project.
1. In the JPA project, run the `UserTest` JUnit test and troubleshoot if necessary until it passes.

### FULL-STACK SMOKE TEST
**THESE STEPS ARE FOR ANOTHER INDIVIDUAL TEAM MEMBER**

#### Implement a DAO Method
1. In the Spring Boot MVC project in `UserDAO`, define a method `User authenticateUser(String username, String password);`. 

1. In the DAO implementation class, implement the method using a JPQL query that includes `username`, `password`, and `enabled`.

#### Implement a controller request-mapping method
1. In the `UserController` add a `public String home(Model model)` method.

   * Return the string "home".

   * Add a model attribute `"SMOKETEST"` with the value returned by the DAO `authenticateUser` method.

#### Display the data in the JSP view.
1. In `home.jsp` add a temporary expression language reference to the model data:

   ```java
   ${SMOKETEST}  <!-- TEMPORARY, DELETE LATER -->
   ```

#### Test the stack
1. Run the Spring Boot application class as a Spring Boot application.
1. Open the site in a browser to confirm the view accesses the database entity.

1. After troubleshooting any issues add, commit, and push the project so the rest of your team can pull, refresh, start their server, and confirm it's working.

### Your Project is Ready