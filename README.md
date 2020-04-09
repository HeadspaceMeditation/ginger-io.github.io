# Ginger Engineering Blog
---

## Preparation

To edit, preview and publish the blog, you should install the following:

Ruby Development Environment

* Ruby version 2.4.0 or above, including all development headers
* RubyGems (which you can check by running gem -v)
* GCC and Make (in case your system doesn’t have them installed, which you can check by running gcc -v,g++ -v and make -v in your system’s command line interface)

Tooling

* Install [Jekyll](https://jekyllrb.com/docs/installation/)


*Checkout the `jekyll` branch for development.  The `master` branch is the published site.*

## Edit Cycle

See [Jekyll posts](https://jekyllrb.com/docs/posts/) for details on how to add a new post.

Run `jekyll serve` to build the site and serve it locally.

## Publishing

0. You should checkout this branch (`jekyll`) in a directory called `ginger-blog`.
1. Checkout the `master` branch of this repository in a sibling directory `../ginger-io.github.io`
2. Run `build.sh` to generate the static site and sync it with `../ginger-io.github.io`
3. Go in `../ginger-io.github.io`, review changes, perform the necessary `git add`, `git rm`, etc, and then `git commit` and `git push` your changes.
