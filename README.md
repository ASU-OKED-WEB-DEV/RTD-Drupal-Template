# RTD Template for Drupal 8 sites
This project is a fork of [Drupal Composer](https://github.com/drupal-composer/drupal-project), a template for building Drupal  8 sites that allows you to manage dependencies (e.g. libraries, modules, and themes) via composer.

## Features
In addition to all of the features provided by the original Drupal Composer project, the RTD web team has added the following:
- Automatic generation of Bootstrap child subtheme (rtdoked).
- Install ASU/RTD modules (e.g. ASU Brand, RTD Tools).
- Install commonly used contrib modules (e.g. FontAwesome, Honeypot).
- Local development tools (e.g. drush aliases generation).

## Usage
Follow the steps below to create a new site:

##### Clone kickstart repo:
```
git clone git@github.com:ASU-OKED-WEB-DEV/RTD-Drupal-Template.git [site-name]
```

##### Customize site settings
Copy `sample-settings.yml` over to `local-settings.yml` and edit the latter file according to the new site's parameters.
```
cp sample-settings.yml local-settings.yml
```

##### Create kickstart site:
SSH into your virtual dev environment and run
```
composer create project
```
The above command will run for a few minutes it performs several tasks, which are listed below.
- Download Drupal core and all dependencies listed on composer.json.
- Create a Bootstrap child-theme (`rtdoked`).
- Download theme packages.
- Enable `rtdoked`.
- Set up drush alias files.

##### Manage dependecies:
Add a new PHP library or Drupal module or theme.
```
composer require "drupal/rules"
```

Add a dev package.
```
composer require --dev "drupal/devel"
```

Update a package.
```
composer require "drupal/pathauto"
```

Remove a package
```
composer remove "drupal/ldap"
```

Add a patch to a Drupal module by modifying your `composer.json` as indicated below 

```json
"extra": {
    "patches": {
        "drupal/foobar": {
            "Patch description": "URL to patch"
        }
    }
}
```

## Development Workflow
### Initial work:
The following steps need to be performed only once.
1. Set up hosting accounts on QA and Prod servers.
1. Create a new GitHub repo and protect the master branch.
1. Protect the repo's master branch by enforcing pull requests and code reviews.
1. Kickstart local site.
1. Add additional modules/dependencies.
1. Edit site's basic configueration (e.g. site name, global email, timezone, etc).
1. Export drupal configuration to files.
1. Initialize repo, add remote, commit files, and push code to GitHub. 
1. Set up QA site: clone repo, install non-dev dependencies and edit settings.php.
1. Push local database to QA.

#### Development work:
Most of the following tasks will be performed regularly by developers:
1. Pick an issue (or create a new one) from the Issue Queue and assign it to yourself. 
1. Clone repo.
1. Create a new branch that branches off from master (see naming conventions below).
1. Pull down QA database.
1. **[TODO]** Enable development mode.
1. Make sure `stage_file_proxy` points to QA or Prod site.
1. Write behavioral and/or unit tests.
1. Make code changes until all tests pass.
1. Refactor code.
1. Commit often (how often? Use your best judgement).
1. Once you're done working on your feature-request or bugfix, disable development mode.
1. Export configuration changes. 
1. Rebase your branch with orgin/master. Fix merge-conflicts if there are any.
1. Push branch to GitHub and create a pull request (PR).
1. Have a teammate review your PR.  
1. Once your PR is approved, merge your branch (use squash commits option).
1. Deploy feature/bugfix to QA site.
1. Have stakeholders review your work.
1. If the client is not happy with your work, create a new issue and start over.  

##### Branch naming conventions
Branch names should include the issue number and a brief description. For example:
- iss1--install-webform-module
- iss19--home-page-styles
- iss25--rtd-training-module

#### Going Live:
Once the stakeholders have reviewed and approved all features, follow the steps below:

##### New Site:
1. Set up Prod site: clone repo, install non-dev dependencies and edit settings.php.
1. Pull database from QA site.
1. Copy over user-uploaded files from QA site (/sites/default/files).
1. Clear caches.
1. Update DNS settings.
1. Perform a smoke test.

##### Existing Site:
1. Deploy new feature/bugfix to Prod site. Follow instructions as described in PR.
1. Perform a smoke test.

### Important links for developers
- [Drupal coding standards page](https://www.drupal.org/docs/develop/standards).
- [PHP The Right Way](http://www.phptherightway.com/).
- [Composer CLI manual](https://getcomposer.org/doc/03-cli.md)
- [JavaScript - MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
- [Modular CSS](http://thesassway.com/modular-css)
- [Git documentation](https://git-scm.com/book/en/v2)
