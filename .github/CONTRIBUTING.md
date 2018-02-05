## Guidelines for Developers
Following strict guidelines may create additional work; however, it will benefit the team as as a whole, and it will pay off in the long run.

## New Repos
- If you're creating a new repo, make sure to protect the master branch so that code contributions can only be done through Pull Requests (PRs).
- Enforce code reviews (by at least one team member) in pull request workflow.

## Development Workflow
Anytime you want to contribute to this repo, follow the steps below:
- Check if the feature or bugfix you want to work on has already been filed on the repo's issue queue.
- If an issue exists, check if there's someone assigned to that ticket. If no one is, assign yourself to it. Otherwise, talk to the assigned developer and check if he/she needs help.
- Otherwise, create a new issue and assign it to yourself. 
- Set up your local development environment by cloning this repo and following instructions on README file.
- If you picked an issue that already existed, check if there's already a branch associated with that issue. If there is, checkout that branch.
- If you created a new issue, create a new branch by following the naming conventions below.
- When you're done working on an issue, rebase your branch so you can get the latest changes from master. Then check that everything still works.
- Once your branch is in sync with master, push your branch to GitHub. Then create a pull request, and have someone test your new feature (or bugfix) and review your code. 
- Once the PR has been reviewed and approved, merge the PR by selecting the option to squash all commits into 1. Then delete the branch. By squashing commits and deleting unused branches, we'll keep the repo clean from clutter.

## Branch naming conventions
Since all branches that get pushed to github should have a corresponding issue, branch names should include the issue number and a brief description.
For example:
- iss1--install-webform-module
- iss19--home-page-styles
- iss25--rtd-training-module

### Important links for developers
- [Pro Git book](https://git-scm.com/book/en/v2)
- [Composer CLI manual](https://getcomposer.org/doc/03-cli.md)
- [PHP The Right Way](http://www.phptherightway.com/).
- [Drupal coding standards page](https://www.drupal.org/docs/develop/standards).
- [JavaScript - MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
- [Module CSS](http://thesassway.com/modular-css)
