# tool

```shell 
Usage: cli [OPTIONS] COMMAND [ARGS]...

  CLI utilities for interacting with the identity-tech ecosystem.

Options:
  --config-path DIRECTORY  Changes the configuration environment.
  -v, --verbose            Enables verbose mode.
  --help                   Show this message and exit.

Commands:
  config     Manage the toolkit configuration settings.
  docptr     Manage DocPtrs, which describe a document which can be
             referenced...
  eco        Perform ecosystem level tasks.
  github     Manage GitHubs, which describe a document which can be
             referenced...
  gitworm    Manage GitWorm checkout.
  google     Read/Write Google Assets.
  help       prints help info
  local      Translate between workspace resident JSON data models.
  logs       View, export and clear semantic log data.
  manual     dumps the manual
  nlp        Apply NLP logic.
  web        Work with non-API based web sources.
  workspace  Manipulate the workspace
  xlate      Translate between workspace resident JSON data models.

```


## config

```shell 
Usage: config [OPTIONS] COMMAND [ARGS]...

  Manage the toolkit configuration settings.

Options:
  --help  Show this message and exit.

Commands:
  dump  Save the current snapshot as JSON.
  load  Replace the existing configuration with another.
  path  Report the current configuration directory.

```


### dump

```shell 
Usage: dump [OPTIONS]



Options:
  --save FILENAME  path to file, or - for stdout
  --help           Show this message and exit.

```


### load

```shell 
Usage: load [OPTIONS]

  Replace the existing configuration with another

Options:
  --new-config FILENAME  input data  [required]
  --help                 Show this message and exit.

```


### path

```shell 
Usage: path [OPTIONS]

  Report the current configuration directory

Options:
  --help  Show this message and exit.

```


## docptr

```shell 
Usage: docptr [OPTIONS] COMMAND [ARGS]...

  Manage DocPtrs, which describe a document which can be referenced using a
  short-form document name, and is either out there, on the internet (e.g. a
  google spreadsheet) or is local.  Docptrs maintain information about how to
  access each type of file.

Options:
  --name TEXT  name of the docptr in scope
  --help       Show this message and exit.

Commands:
  add      Add docptrs
  clear    Erase all docptrs.
  del      Remove a document from consideration.
  info     Dump info of docptr
  list     List all docptrs.
  resolve  Resolve a model definition
  tag      Manage Tags on DocPtrs

```


### add

```shell 
Usage: add [OPTIONS] COMMAND [ARGS]...

  Add docptrs

Options:
  --update    update an existing docptr
  --tag TEXT  Initial tags to provide
  --help      Show this message and exit.

Commands:
  google-doc          Add a google doc as a docptr
  google-file         Add an arbitary file (not gdoc or gsheet)
  google-folder       Add a google folder
  google-spreadsheet  Add a google spreadsheet as a docptr
  google-worksheet    Add a google sheet as a docptr
  workspace-doc       Add a local workspace file

```


#### google-doc

```shell 
Usage: google-doc [OPTIONS]

  Add a google doc as a docptr

Options:
  --fileid GOOGLE-DRIVE-FILE  [required]
  --help                      Show this message and exit.

```


#### google-file

```shell 
Usage: google-file [OPTIONS]

  Add an arbitary file (not gdoc or gsheet)

Options:
  --fileid GOOGLE-DRIVE-FILE  [required]
  --mime-type TEXT            [required]
  --help                      Show this message and exit.

```


#### google-folder

```shell 
Usage: google-folder [OPTIONS]

  Add a google folder

Options:
  --folder GOOGLE-DRIVE-FOLDER-ID
  --help                          Show this message and exit.

```


#### google-spreadsheet

```shell 
Usage: google-spreadsheet [OPTIONS]

  Add a google spreadsheet as a docptr

Options:
  --file GOOGLE-SHEET-FILE
  --help                    Show this message and exit.

```


#### google-worksheet

```shell 
Usage: google-worksheet [OPTIONS]

  Add a google sheet as a docptr

Options:
  --sheet GOOGLE-SHEET-FILE
  --help                     Show this message and exit.

```


#### workspace-doc

```shell 
Usage: workspace-doc [OPTIONS]

  Add a local workspace file

Options:
  --path TEXT
  --help       Show this message and exit.

```


### clear

```shell 
Usage: clear [OPTIONS]

  Erase all docptrs.

Options:
  --help  Show this message and exit.

```


### del

```shell 
Usage: del [OPTIONS]

  Simply report the current configuration used by default.

Options:
  --help  Show this message and exit.

```


### info

```shell 
Usage: info [OPTIONS]

  Dump info of docptr

Options:
  --help  Show this message and exit.

```


### list

```shell 
Usage: list [OPTIONS]

  Report list of document pointers in various formats and apply various
  filters.

Options:
  --include [all|retired-only|active-only]
                                  Include Only Retired or All
  --type TEXT                     Type to include
  --table-slugify TEXT            Slugify rows.
  --table-sort TEXT               Sort by cols, in order
  --table-no-col TEXT             Exclude these cols.
  --table-col TEXT                Emit only these cols.
  --table-list TEXT               Emit one col as a list (for shell work).
  --table-skip-data               Print column headers only.
  --table-reduce                  Reduce table contents.
  --quiet                         Do not display pretty table
  --json-minify                   Should the data be minified
  --json-indent INTEGER           How much to indent formatted json
  --json FILENAME                 Path to which to save the data as JSON, - for
                                  stdout
  --json-dp-tag TAG-SET-OPTION    Tag associated docptr thusly
  --json-dp-create                Create docptr if required
  --csv FILENAME                  Path to which to save the data as csv, - for
                                  stdout
  --csv-dp-tag TAG-SET-OPTION     Tag associated docptr thusly
  --csv-dp-create                 Create docptr if required
  --xlsx FILENAME                 Path to which to save the data as xlsx, - for
                                  stdout
  --xlsx-dp-tag TAG-SET-OPTION    Tag associated docptr thusly
  --xlsx-dp-create                Create docptr if required
  --help                          Show this message and exit.

```


### resolve

```shell 
Usage: resolve [OPTIONS]

  Resolve a model definition

Options:
  --using TEXT                  what to resolve  [required]
  --table-slugify TEXT          Slugify rows.
  --table-sort TEXT             Sort by cols, in order
  --table-no-col TEXT           Exclude these cols.
  --table-col TEXT              Emit only these cols.
  --table-list TEXT             Emit one col as a list (for shell work).
  --table-skip-data             Print column headers only.
  --table-reduce                Reduce table contents.
  --quiet                       Do not display pretty table
  --json-minify                 Should the data be minified
  --json-indent INTEGER         How much to indent formatted json
  --json FILENAME               Path to which to save the data as JSON, - for
                                stdout
  --json-dp-tag TAG-SET-OPTION  Tag associated docptr thusly
  --json-dp-create              Create docptr if required
  --csv FILENAME                Path to which to save the data as csv, - for
                                stdout
  --csv-dp-tag TAG-SET-OPTION   Tag associated docptr thusly
  --csv-dp-create               Create docptr if required
  --xlsx FILENAME               Path to which to save the data as xlsx, - for
                                stdout
  --xlsx-dp-tag TAG-SET-OPTION  Tag associated docptr thusly
  --xlsx-dp-create              Create docptr if required
  --help                        Show this message and exit.

```


### tag

```shell 
Usage: tag [OPTIONS] COMMAND [ARGS]...

  Manage Tags on DocPtrs

Options:
  --help  Show this message and exit.

Commands:
  add     Add a tag to a docptr.
  list    List all tags used by docptrs.
  remove  Remove a tag from a docptr.
  report  Generate detailed report about tag use.

```


#### add

```shell 
Usage: add [OPTIONS]

  Add a tag to a docptr.

Options:
  --name TEXT  name of docptr  [required]
  --tag TEXT   tag to add  [required]
  --help       Show this message and exit.

```


#### list

```shell 
Usage: list [OPTIONS]

  List all tags used by docptrs.

Options:
  --table-slugify TEXT          Slugify rows.
  --table-sort TEXT             Sort by cols, in order
  --table-no-col TEXT           Exclude these cols.
  --table-col TEXT              Emit only these cols.
  --table-list TEXT             Emit one col as a list (for shell work).
  --table-skip-data             Print column headers only.
  --table-reduce                Reduce table contents.
  --quiet                       Do not display pretty table
  --json-minify                 Should the data be minified
  --json-indent INTEGER         How much to indent formatted json
  --json FILENAME               Path to which to save the data as JSON, - for
                                stdout
  --json-dp-tag TAG-SET-OPTION  Tag associated docptr thusly
  --json-dp-create              Create docptr if required
  --csv FILENAME                Path to which to save the data as csv, - for
                                stdout
  --csv-dp-tag TAG-SET-OPTION   Tag associated docptr thusly
  --csv-dp-create               Create docptr if required
  --xlsx FILENAME               Path to which to save the data as xlsx, - for
                                stdout
  --xlsx-dp-tag TAG-SET-OPTION  Tag associated docptr thusly
  --xlsx-dp-create              Create docptr if required
  --help                        Show this message and exit.

```


#### remove

```shell 
Usage: remove [OPTIONS]

  Simply report the current configuration used by default.

Options:
  --help  Show this message and exit.

```


#### report

```shell 
Usage: report [OPTIONS]

  Simply report the current configuration used by default.

Options:
  --help  Show this message and exit.

```


## eco

```shell 
Usage: eco [OPTIONS] COMMAND [ARGS]...

  Perform ecosystem level tasks.

Options:
  --help  Show this message and exit.

Commands:
  consume  Consume information from ecosystem endpoints.
  focus    Perform focused ecosystem level tasks.
  model    Work directly with model elements
  produce  Publish information from the KISIA model

```


### consume

```shell 
Usage: consume [OPTIONS] COMMAND [ARGS]...

  Consume information from ecosystem endpoints.  Endpoint names are
  docptrs.....     link to docptrs generic doc     types : DID Service
  Endpoint, URL, Repo, Etc.....

  When you state "Consume <X>" you reach out to data source <X>, and engage an
  accessor, which uses *your* authority on the named services to access
  information.  This provides a real-world, up-to-date, active api bridge -
  which can be improved as identity-tech matures.

  The intent of a "consume" command is always an update to the data record,
  which is always attached to a context, and it is always based upon a query
  into the environment.

  We understand the query, in this case, to be both named and parametric.  The
  query execution then collects and reports the

  When you execute the consume command, you must provide an explanation as to
  why. which has whatever logic it needs and tries to integrate with the local
  authentication

  The result of a "consume" command is an update to the local data record, and
  as such, it requires a statement of "intention".

  Thinking in terms of a cheque from days of old, the "intention" is the
  specified words, and the attached log-records are the expression of that
  intent.  The signature upon the check is applied provided that the intent-
  calculation responds w/o error.

  Running the "tool eco consume" command should be considered like drawing
  upon a bank, but instead of currency offering a data-expression. Don't be
  quick to turn this into a "smart contract" - instead, just watch the
  ceremony....

  You first declare an intent to receive-information:     <wrapper provider=X
  >         you request the information from a <provider> of that information
  the provider responds (or errors)     </wrapper>     where wrapper

  Business Consume Tasks
    - manage information about a business
    - record the sponsoring of an event
    - manage records of business partnerships

  Legal Consume Tasks
    - manage information about recent legislation

  Technology Consume Tasks
    - manage information about a standard
    - manage information about a signficant repository

Options:
  --help  Show this message and exit.

Commands:
  dif          Personal Data
  hyperledger  Personal Data
  idcommons    Personal Data
  iiw          Personal Data
  mydata       Personal Data
  pd           Personal Data
  rwot         Personal Data
  sovrin       Personal Data
  ssimeetup    Personal Data
  veres_one    Personal Data

```


#### dif

```shell 
Usage: dif [OPTIONS] COMMAND [ARGS]...

  Personal Data

Options:
  --help  Show this message and exit.

```


#### hyperledger

```shell 
Usage: hyperledger [OPTIONS] COMMAND [ARGS]...

  Personal Data

Options:
  --help  Show this message and exit.

```


#### idcommons

```shell 
Usage: idcommons [OPTIONS] COMMAND [ARGS]...

  Personal Data

Options:
  --help  Show this message and exit.

```


#### iiw

```shell 
Usage: iiw [OPTIONS] COMMAND [ARGS]...

  Personal Data

Options:
  --help  Show this message and exit.

```


#### mydata

```shell 
Usage: mydata [OPTIONS] COMMAND [ARGS]...

  Personal Data

Options:
  --help  Show this message and exit.

```


#### pd

```shell 
Usage: pd [OPTIONS] COMMAND [ARGS]...

  Personal Data

Options:
  --help  Show this message and exit.

```


#### rwot

```shell 
Usage: rwot [OPTIONS] COMMAND [ARGS]...

  Personal Data

Options:
  --help  Show this message and exit.

```


#### sovrin

```shell 
Usage: sovrin [OPTIONS] COMMAND [ARGS]...

  Personal Data

Options:
  --help  Show this message and exit.

```


#### ssimeetup

```shell 
Usage: ssimeetup [OPTIONS] COMMAND [ARGS]...

  Personal Data

Options:
  --help  Show this message and exit.

```


#### veres_one

```shell 
Usage: veres_one [OPTIONS] COMMAND [ARGS]...

  Personal Data

Options:
  --help  Show this message and exit.

```


### focus

```shell 
Usage: focus [OPTIONS] COMMAND [ARGS]...

  Perform focused ecosystem level tasks.  Focused tasks manpipulate the KISIA
  model through filters that help maintain the integraty of the global map.

  Business Focus Tasks
    - manage information about a business
    - record the sponsoring of an event
    - manage records of business partnerships

  Legal Focus Tasks
    - manage information about recent legislation

  Technology Focus Tasks
    - manage information about a standard
    - manage information about a signficant repository

Options:
  --help  Show this message and exit.

Commands:
  business   Manipulate information about the business aspects of SSI.
  legal      Manipulate information about the Legal aspects of SSI.
  technical  Manipulate information about the Technical aspects of SSI.

```


#### business

```shell 
Usage: business [OPTIONS] COMMAND [ARGS]...

  Manipulate information about the business aspects of SSI.

  Specific Business Events     report-event     anticipate-event     announce-
  event     announce-capability

  Ontology Core     assert-event-info     assert-product-info     assert-
  capability-info

  Cross focus linking is managed in this way     legal-bridge     tech-bridge

Options:
  --help  Show this message and exit.

```


#### legal

```shell 
Usage: legal [OPTIONS] COMMAND [ARGS]...

  Manipulate information about the Legal aspects of SSI.

  Specific Legal Events
      report-event
      anticipate-event
      announce-event
      announce-capability

  Ontology Core
      assert-legislation-info
      assert-jurisdiction-info
      assert-project-info
      assert-repository-info
      assert-feature-info

  Cross focus linking is managed in this way     legal-bridge     tech-bridge

Options:
  --help  Show this message and exit.

```


#### technical

```shell 
Usage: technical [OPTIONS] COMMAND [ARGS]...

  Manipulate information about the Technical aspects of SSI.

Options:
  --help  Show this message and exit.

```


### model

```shell 
Usage: model [OPTIONS] COMMAND [ARGS]...

  Work directly with model elements

Options:
  --help  Show this message and exit.

Commands:
  authority      Governments, Jurisdictions, and other governing bodies.
  capability     Capabilities are things we can do.
  documents      Documents are publications, legislation, papers,...
  events         Events are things that happen.
  geography      Countries, Governments,
  legal          Not sure how to decompose this...
  organizations  Companies, Projects, Teams, Working Groups, etc.
  people         Natural Persons
  repositories   Manage information about Standards
  requirements   What does SSI technology need to do?
  standards      Technical specifications around which groups can organize
  use_cases      Manage information about SSI UseCases

```


#### authority

```shell 

```


##### assert

```shell 
Import Error
```


#### capability

```shell 

```


##### assert

```shell 
Import Error
```


#### documents

```shell 

```


##### assert

```shell 
Import Error
```


##### import-to-workspace

```shell 
Import Error
```


#### events

```shell 

```


##### assert

```shell 
Import Error
```


#### geography

```shell 

```


##### assert

```shell 
Import Error
```


#### legal

```shell 

```


##### assert

```shell 
Import Error
```


#### organizations

```shell 

```


##### assert

```shell 
Import Error
```


#### people

```shell 

```


##### assert

```shell 
Import Error
```


#### repositories

```shell 

```


##### assert

```shell 
Import Error
```


#### requirements

```shell 

```


##### assert

```shell 
Import Error
```


#### standards

```shell 

```


##### assert

```shell 
Import Error
```


#### use_cases

```shell 

```


##### assert

```shell 
Import Error
```


### produce

```shell 
Usage: produce [OPTIONS] COMMAND [ARGS]...

  Publish information from the KISIA model

Options:
  --help  Show this message and exit.

```


## github

```shell 
Usage: github [OPTIONS] COMMAND [ARGS]...

  Manage GitHubs, which describe a document which can be referenced using a
  short-form document name, and is either out there, on the internet (e.g. a
  google spreadsheet) or is local.  Docptrs maintain information about how to
  access each type of file.

Options:
  --help  Show this message and exit.

Commands:
  describe  Describe a repository
  org       Work with github organizations
  spider    Spider an organization

```


### describe

```shell 
Usage: describe [OPTIONS]

  Obtain information about a repository

Options:
  --repo TEXT  The repo
  --help       Show this message and exit.

```


### org

```shell 
Usage: org [OPTIONS] ORG COMMAND [ARGS]...

  Work with github organizations

Options:
  --help  Show this message and exit.

Commands:
  repolist  Dump information about the repos

```


#### repolist

```shell 
Usage: repolist [OPTIONS]

  Dump information about the repos

Options:
  --table-slugify TEXT          Slugify rows.
  --table-sort TEXT             Sort by cols, in order
  --table-no-col TEXT           Exclude these cols.
  --table-col TEXT              Emit only these cols.
  --table-list TEXT             Emit one col as a list (for shell work).
  --table-skip-data             Print column headers only.
  --table-reduce                Reduce table contents.
  --quiet                       Do not display pretty table
  --json-minify                 Should the data be minified
  --json-indent INTEGER         How much to indent formatted json
  --json FILENAME               Path to which to save the data as JSON, - for
                                stdout
  --json-dp-tag TAG-SET-OPTION  Tag associated docptr thusly
  --json-dp-create              Create docptr if required
  --csv FILENAME                Path to which to save the data as csv, - for
                                stdout
  --csv-dp-tag TAG-SET-OPTION   Tag associated docptr thusly
  --csv-dp-create               Create docptr if required
  --xlsx FILENAME               Path to which to save the data as xlsx, - for
                                stdout
  --xlsx-dp-tag TAG-SET-OPTION  Tag associated docptr thusly
  --xlsx-dp-create              Create docptr if required
  --help                        Show this message and exit.

```


### spider

```shell 
Usage: spider [OPTIONS]

  Obtain information about an organization

Options:
  --org TEXT  The repo
  --help      Show this message and exit.

```


## gitworm

```shell 
Usage: gitworm [OPTIONS] COMMAND [ARGS]...

  Manage GitWorm checkout.

Options:
  --worm DIRECTORY  path to worm base
  --identity TEXT   identity
  --help            Show this message and exit.

Commands:
  export  Export gitworm to a single json file.
  import  Import from single json file and store it in gitworm.
  info    Dump information about gitworm
  pull    Pull all branch data and update current branch.
  push    Push all branch data from current branch.
  status  Report status about the gitworm checkout.
  test    Dump information about gitworm

```


### export

```shell 
Usage: export [OPTIONS]

  Export gitworm to a single json file.

Options:
  --save FILENAME  path to JSON file to export
  --help           Show this message and exit.

```


### import

```shell 
Usage: import [OPTIONS]

  Import from single json file and store it in gitworm.

Options:
  --load FILENAME  path to JSON file to import
  --prune          delete anything not in input
  --message TEXT   path to file  [required]
  --help           Show this message and exit.

```


### info

```shell 
Usage: info [OPTIONS]

  Dump information about gitworm

Options:
  --help  Show this message and exit.

```


### pull

```shell 
Usage: pull [OPTIONS]



Options:
  --help  Show this message and exit.

```


### push

```shell 
Usage: push [OPTIONS]



Options:
  --help  Show this message and exit.

```


### status

```shell 
Usage: status [OPTIONS]

  Report status about the gitworm checkout.

Options:
  --help  Show this message and exit.

```


### test

```shell 
Usage: test [OPTIONS]

  Dump information about gitworm

Options:
  --help  Show this message and exit.

```


## google

```shell 
Usage: google [OPTIONS] COMMAND [ARGS]...

  Read/Write Google Assets.

  These commands support scripted access to a pool of google
  assets, which include:
    * Google Auth Mgmt
    * Google Documents
      - support for transation to/from HTML
      - support for transation to/from JSON (internal structure)
    * Google Sheets
      - range editing (upload to replace, and download to JSON)
          - values
          - conditional-formatting
          - formulas
      - sheet/document management
          - delete a sheet
          - clear an entire document
          - copy one or more sheets, from one or more documents
            to a single document
      - json coupling
          - download one more more sheets, from one or more documents
            to a single JSON file
          - assert a document structure from a JSON file, making each
            identified document match the specification
    * Google Presentations (not yet supported)
    * Conventional Mime-Types
      - basic upload/download with simple mime-type handling

  These commands are integrated with the workspace configuration
  system.  We'll get to this
    - talk about docptrs
    - talk about resource sets
    - coupling of login w/ config & environment

  Internal JSON file formats
    - 2D JSON
      - Value Data
      - Conditional Formatting Data
      - Formula Data
    - JSON Google Sheet Data Model (multiple Document/Worksheet)
    - JSON Google Doc Structural Map

Options:
  --help  Show this message and exit.

Commands:
  basic-download    Simple download command (for script support).
  basic-upload      Simple upload command (for script support).
  drive-scan        List spreadsheet documents in folder.
  gdoc-assemble     Assemble a google doc from a structure.
  gdoc-assert       Make a google doc look like a local doc
  gdoc-destructure  Break a google doc into text blobs.
  gdoc-download     Download a google doc.
  login             Login to Google.
  logout            Logout of Google.
  model-assert      Make google sheets look like the input.
  model-download    Sheet model download.
  range-download    Copy a 2D array of values out of a sheet.
  range-patch       Copy a 2D array of values into a sheet.
  setup             Login to Google.
  sheet-combine     Combine multiple sheets into one.
  sheet-delete      Delete a sheet from a gsheet document.
  sheet-list        List sheets in a gsheet document.

```


### basic-download

```shell 
Usage: basic-download [OPTIONS]

  Download a file.

  This is intended to serve as a primitive for use within scripts and to
  integrate basic file motion for supporting documents, other than sheets and
  google docs (or google slides, etc.)

  These are identified by a simple mime-type, which is guessed by file
  extension if not stated explicitly.

Options:
  --doc GOOGLE-DRIVE-FILE  FileId or url of existing file  [required]
  --save FILENAME          path to file, or - for stdout  [required]
  --type TEXT              type of data to download
  --to TEXT                docptr, when we get around to those
  --help                   Show this message and exit.

```


### basic-upload

```shell 
Usage: basic-upload [OPTIONS]

  Upload a file.

  This is intended to serve as a primitive for use within scripts and to
  integrate basic file motion for supporting documents, other than sheets and
  google docs (or google slides, etc.)

  These are identified by a simple mime-type, which is guessed by file
  extension if not stated explicitly.

Options:
  --folder GOOGLE-DRIVE-FILE  FileId of existing file
  --load FILENAME             path to file
  --type TEXT                 type of data to upload  [required]
  --from TEXT                 docptr, when we get around to those
  --help                      Show this message and exit.

```


### drive-scan

```shell 
Usage: drive-scan [OPTIONS]

  Scan google folder recursively and map sheets

Options:
  --folder GOOGLE-DRIVE-FOLDER-ID
                                  [required]
  --depth INTEGER
  --type [spreadsheet|document|folder|worksheet]
                                  filter for type
  --table-slugify TEXT            Slugify rows.
  --table-sort TEXT               Sort by cols, in order
  --table-no-col TEXT             Exclude these cols.
  --table-col TEXT                Emit only these cols.
  --table-list TEXT               Emit one col as a list (for shell work).
  --table-skip-data               Print column headers only.
  --table-reduce                  Reduce table contents.
  --quiet                         Do not display pretty table
  --json-minify                   Should the data be minified
  --json-indent INTEGER           How much to indent formatted json
  --json FILENAME                 Path to which to save the data as JSON, - for
                                  stdout
  --json-dp-tag TAG-SET-OPTION    Tag associated docptr thusly
  --json-dp-create                Create docptr if required
  --csv FILENAME                  Path to which to save the data as csv, - for
                                  stdout
  --csv-dp-tag TAG-SET-OPTION     Tag associated docptr thusly
  --csv-dp-create                 Create docptr if required
  --xlsx FILENAME                 Path to which to save the data as xlsx, - for
                                  stdout
  --xlsx-dp-tag TAG-SET-OPTION    Tag associated docptr thusly
  --xlsx-dp-create                Create docptr if required
  --docptrs                       Create docptrs
  --tag TEXT                      Initial tags to provide
  --help                          Show this message and exit.

```


### gdoc-assemble

```shell 
Usage: gdoc-assemble [OPTIONS]

  Given a JSON file in the format provided by gdoc-desctructure

Options:
  --doc GOOGLE-DRIVE-FILE  FileId or url of existing file  [required]
  --from TEXT              docptr, when we get around to those
  --help                   Show this message and exit.

```


### gdoc-assert

```shell 
Usage: gdoc-assert [OPTIONS]

  Upload a google doc.

Options:
  --doc GOOGLE-DRIVE-FILE  FileId or url of existing file  [required]
  --load FILENAME          path to file
  --from TEXT              docptr, when we get around to those
  --help                   Show this message and exit.

```


### gdoc-destructure

```shell 
Usage: gdoc-destructure [OPTIONS]

  Analyze a gdoc and decompose it into a hierarchy of text blobs and store the
  result in a JSON file.

Options:
  --doc GOOGLE-DRIVE-FILE  FileId or url of existing file  [required]
  --to TEXT                docptr, when we get around to those
  --help                   Show this message and exit.

```


### gdoc-download

```shell 
Usage: gdoc-download [OPTIONS]

  Download a google doc in a specified format.  Standard gdoc types can be
  used....  should we have aliases, like --type html or --type pdf?

Options:
  --doc GOOGLE-DRIVE-FILE  FileId or url of existing file  [required]
  --save FILENAME          path to file, or - for stdout
  --type TEXT              type of data to download
  --to TEXT                docptr, when we get around to those
  --help                   Show this message and exit.

```


### login

```shell 
Usage: login [OPTIONS]

  Log in to google and records API credentials in the config directory.

Options:
  --help  Show this message and exit.

```


### logout

```shell 
Usage: logout [OPTIONS]

  Logout of google and remove any config cached credentials.

Options:
  --help  Show this message and exit.

```


### model-assert

```shell 
Usage: model-assert [OPTIONS]

  Upload a JSON model, splitting it into documents and sheets.  Every document
  touched will be erased and only the identified sheets will be present.  Only
  values are uploaded, no conditional formating or formulas.

Options:
  --using TEXT  Named list of sheets defining a model
  --load TEXT   path to file
  --from TEXT   docptr, when we get around to those
  --help        Show this message and exit.

```


### model-download

```shell 
Usage: model-download [OPTIONS]

  Download one or more sheets, from one or more documents, and combine them
  into a single JSON file format.  Only values are downloaded.

Options:
  --using TEXT                  Named list of sheets defining a model
                                [required]
  --json-minify                 Should the data be minified
  --json-indent INTEGER         How much to indent formatted json
  --json FILENAME               Path to which to save the data as JSON, - for
                                stdout
  --json-dp-tag TAG-SET-OPTION  Tag associated docptr thusly
  --json-dp-create              Create docptr if required
  --help                        Show this message and exit.

```


### range-download

```shell 
Usage: range-download [OPTIONS]

  Download a rectangle of JSON data from a specific point in an existing
  sheet.

  Examples:
  ---------------------------------------------
  # when processing from a script iterating over file ids
  range-download --sheet <GoogleSheetFile>
                 --range arbitrary-string
                 --save <writeableFilePath>
                 --type <type>

  # when cutting/pasting a url from a browser, name sure that the
  # sheet name is appended in addition to the sheet id if present
  range-download --save <GoogleSheetFile>
                 --range <GoogleRangeId>
                 --save -
                 --type <type>

Options:
  --sheet GOOGLE-SHEET-FILE  [required]
  --range CELL-RANGE         cell range (eg. A1:B2)  [required]
  --save FILENAME            path to file, or - for stdout  [required]
  --type [values|formula]    type of data to download (values or formula)
  --help                     Show this message and exit.

```


### range-patch

```shell 
Usage: range-patch [OPTIONS]

  Upload a rectangle of JSON data to a specific point in an existing sheet.

  Examples:
  ---------------------------------------------
  # when processing from a script iterating over file ids
  range-patch --fileid <GoogleFileId>
              --sheet <GoogleSheetIdOrName>
              --cell <GoogleCellId>
              --values <pathToExisting2DJsonFile>

  # when cutting/pasting a url from a browser
  range-patch --url <GoogleSheetUrlId>
              --cell <GoogleCellId>
              --values <pathToExisting2DJsonFile>

  # updating the conditional formatting of a range
  range-patch --url <GoogleSheetUrlId>
              --cell <GoogleCellId>
              --metadata <pathToExisting2DJsonFileOfCellMetadata>

  Arguments:
  ---------------------------------------------
  fileid -> is the file id of the gsheet document, it must exist or an
            error is printed.
  sheet  -> this is the string name of the sheet or the sheet id
  url    -> this is the full url, including fileid and sheet id
  cell   -> A1 or B77 and so forth
  values -> Path to existing file containing specific JSON (data rectangle of values)
  mnetadata   -> Path to existing file containing specific JSON (data rectangle of metadata)

Options:
  --fileid TEXT    FileId of existing file
  --sheet TEXT     sheet id or name
  --url TEXT       complete url of existing file
  --values TEXT    path to file
  --metadata TEXT  path to file
  --cell TEXT      name of cell in upper left
  --help           Show this message and exit.

```


### setup

```shell 
Usage: setup [OPTIONS]

  Log in to google and records API credentials in the config directory.

Options:
  --help  Show this message and exit.

```


### sheet-combine

```shell 
Usage: sheet-combine [OPTIONS]

  Combine one or more sheets, from one or more documents, into a single
  document which contains just those sheets.

  The target document must exist ahead of time, but any contents will be
  deleted.

Options:
  --sheet GOOGLE-DRIVE-FILE  FileId or url of existing file  [required]
  --using TEXT               Named list of sheets defining a model  [required]
  --help                     Show this message and exit.

```


### sheet-delete

```shell 
Usage: sheet-delete [OPTIONS]

  Delete a sheet from a gsheet document.

  Examples:
  ---------------------------------------------
  sheet-delete --sheet <GoogleSheetFile>

Options:
  --sheet GOOGLE-SHEET-FILE  [required]
  --help                     Show this message and exit.

```


### sheet-list

```shell 
Usage: sheet-list [OPTIONS]

  List sheets in a gsheet document

  Examples:
  ---------------------------------------------
  sheet-list --sheet <GoogleDocFile>

Options:
  --doc  GOOGLE-DRIVE-FILE  FileId or url of existing file  [required]
  --help                    Show this message and exit.

```


## help

```shell 
Usage: help [OPTIONS]

  prints help info

Options:
  --help  Show this message and exit.

```


## local

```shell 
Usage: local [OPTIONS] COMMAND [ARGS]...

  Translate between workspace resident JSON data models.

Options:
  --help  Show this message and exit.

Commands:
  query  Run Test Query

```


### query

```shell 
Usage: query [OPTIONS]

  Run Test Query

Options:
  --from FILENAME  input data
  --help           Show this message and exit.

```


## logs

```shell 
Usage: logs [OPTIONS] COMMAND [ARGS]...

  View, export and clear semantic log data.

Options:
  --help  Show this message and exit.

Commands:
  docs  Export logs about doc updates.
  http  Report logs about http traffic.

```


### docs

```shell 
Usage: docs [OPTIONS]

  Report information about docptr uploads, downloads.

Options:
  --help  Show this message and exit.

```


### http

```shell 
Usage: http [OPTIONS]

  Report information about docptr uploads, downloads.

Options:
  --help  Show this message and exit.

```


## manual

```shell 
Usage: manual [OPTIONS]

  dumps the manual

Options:
  --help  Show this message and exit.

```


## nlp

```shell 
Usage: nlp [OPTIONS] COMMAND [ARGS]...

  Apply NLP logic.

Options:
  --help  Show this message and exit.

Commands:
  evalute-complexity           Evaluate the Complexity of a Document.
  generate-glossary            Evaluate the Complexity of a Document.
  generate-term-occurance-map  Evaluate the Complexity of a Document.
  index-terms                  Evaluate the Complexity of a Document.
  split-sentences              Evaluate the Complexity of a Document.

```


### evalute-complexity

```shell 
Usage: evalute-complexity [OPTIONS]



Options:
  --help  Show this message and exit.

```


### generate-glossary

```shell 
Usage: generate-glossary [OPTIONS]



Options:
  --help  Show this message and exit.

```


### generate-term-occurance-map

```shell 
Usage: generate-term-occurance-map [OPTIONS]



Options:
  --help  Show this message and exit.

```


### index-terms

```shell 
Usage: index-terms [OPTIONS]



Options:
  --help  Show this message and exit.

```


### split-sentences

```shell 
Usage: split-sentences [OPTIONS]



Options:
  --help  Show this message and exit.

```


## web

```shell 
Usage: web [OPTIONS] COMMAND [ARGS]...

  Work with non-API based web sources.

Options:
  --help  Show this message and exit.

Commands:
  download  Download a file via HTTP or HTTP(S).

```


### download

```shell 
Usage: download [OPTIONS]

      Download a file given a docptr or url, and update the document tracking
      logs.

  download --docptr <DocPtr>
      This will download a document and save it in specified
      workspace path.  It will abort if no workspace path is
      configured.

  download --docptr <DocPtr> --to <WorkspacePath>
      This will download a document and set the workspace path
      to the workspace path given if the workspace path is
      not given.  If the workspace path is given, and it does
      not match, then the command aborts.

  download --docptr <DocPtr> --save-to <SystemPath>
      This will download a document to a specific system path.

  download --url <Url> --to <WorkspacePath>
      This will assess a file from a URL and add it to the config
      as a docptr if the URL can be accessed.  It will then trigger
      download via the docptr.

Options:
  --help  Show this message and exit.

```


## workspace

```shell 

```


### change-path

```shell 
Usage: change-path [OPTIONS]

  Change workspace path in the configuration

Options:
  --path DIRECTORY  Source from which to load the data as JSON, - for stdin
                    [required]
  --help            Show this message and exit.

```


### clear

```shell 
Usage: clear [OPTIONS]

  Erase all workspace contents and workspace docptrs

Options:
  --help  Show this message and exit.

```


### docptrs

```shell 
Usage: docptrs [OPTIONS]

  Report list of document pointers in various formats and apply various
  filters.

Options:
  --table-slugify TEXT          Slugify rows.
  --table-sort TEXT             Sort by cols, in order
  --table-no-col TEXT           Exclude these cols.
  --table-col TEXT              Emit only these cols.
  --table-list TEXT             Emit one col as a list (for shell work).
  --table-skip-data             Print column headers only.
  --table-reduce                Reduce table contents.
  --quiet                       Do not display pretty table
  --json-minify                 Should the data be minified
  --json-indent INTEGER         How much to indent formatted json
  --json FILENAME               Path to which to save the data as JSON, - for
                                stdout
  --json-dp-tag TAG-SET-OPTION  Tag associated docptr thusly
  --json-dp-create              Create docptr if required
  --csv FILENAME                Path to which to save the data as csv, - for
                                stdout
  --csv-dp-tag TAG-SET-OPTION   Tag associated docptr thusly
  --csv-dp-create               Create docptr if required
  --xlsx FILENAME               Path to which to save the data as xlsx, - for
                                stdout
  --xlsx-dp-tag TAG-SET-OPTION  Tag associated docptr thusly
  --xlsx-dp-create              Create docptr if required
  --help                        Show this message and exit.

```


### dump

```shell 
Usage: dump [OPTIONS]

  Dump workspace document as json

Options:
  --from FILENAME               Source from which to load the data as JSON, -
                                for stdin  [required]
  --json-minify                 Should the data be minified
  --json-indent INTEGER         How much to indent formatted json
  --json FILENAME               Path to which to save the data as JSON, - for
                                stdout
  --json-dp-tag TAG-SET-OPTION  Tag associated docptr thusly
  --json-dp-create              Create docptr if required
  --help                        Show this message and exit.

```


