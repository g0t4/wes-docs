# `vagrant snapshot` command

- `snapshots` - imagine if you could freeze time and save a copy of an entire machine or multiple machines and later restore to that point in time!
  - [`vagrant snapshot` docs](https://www.vagrantup.com/docs/cli/snapshot.html)
- This is invaluable for testing / learning and for `Configuration Management` (`CM`) 
  - `Efficiency` - especially for time consuming config design
    - Like, installing (remote) packages without caching 
- `Snapshots` are a defacto, consistent caching mechanism to afford `efficiency` and `reproducibility` in CM design regardless what tools you are using and how they do or do not support similar safeguards! 
  - Imagine testing a distribution upgrade that takes an hour...
    - ...followed by adding packages and oops you type a package name wrong and you don't just get a failure message that the package doesn't exist... say you install other software... with complex configuration! 
    - Do you want to back it out manually? 
      - Do you know how? Can you find out how?
      - What if you miss a step to manually revert? 
      - So, how about snapshot before adding packages! 
  - Caching is great in real life but can cause issues if not tested/factored into your CM strategy. Caching mechanisms afford `runtime efficiency`, snapshots afford `design time efficiency`. 

## Named based snapshots

- [save](https://www.vagrantup.com/docs/cli/snapshot.html#snapshot-save)
- [restore](https://www.vagrantup.com/docs/cli/snapshot.html#snapshot-restore)
- Give a name to a snapshot to describe what point in time you are capturing 
  - Restore any snapshot (by name) at any time regardless if you created snapshots after... 
    - This helps with non-linear jumps in your `"snapshot stack"` (that's how I like to think of it). 
  - This also allows for `branching` to test alternative routes of changes
  - Occasionally, I use this for a course. I might snapshot m1-begin, m1-end, m2-start, m2-end, m3-start, `...` 
    - Right before key demos if I want simulate a dry-run and rollback to make sure my ducks are in a row!

## Stack based snapshots approach

- [push](https://www.vagrantup.com/docs/cli/snapshot.html#snapshot-push) a snapshot onto a snapshot stack
- [pop](https://www.vagrantup.com/docs/cli/snapshot.html#snapshot-pop) a snapshot off of a snapshot stack
- If you don't have a need to name your snapshots to give meaning to what you are snapshotting you can quickly test single changes (defacto dry run mechanism) by:
  - push snapshot
  - test change
  - pop snapshot
- You can also keep pushing onto the stack if you want to test a sequence of changes with a restore point in between each. Think of a series of restore points.

## Managing snapshots

- [list](https://www.vagrantup.com/docs/cli/snapshot.html#snapshot-list) all snapshots
- [delete](https://www.vagrantup.com/docs/cli/snapshot.html#snapshot-delete) a named snapshot, much like `pop`