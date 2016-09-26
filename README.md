# What is this?
This is a demonstration of a problem I have with Autolayout inside UITableViewCells. The issue has to do with cells containing views whose height depends on their width (similar to how UILabels inside of UITableViewCells work).

`TestStaticCollectionView` tries to contain multiple smaller views, all with an intrinsic content size of their own, and display them inside a table view cell. However, its height is calculated incorrectly, and I'm not sure how to get it to work correctly.

What I would expect it to look like:

![Expected](expected.png | width=100)

What it actually looks like:

![Actual](actual.png | width=100)
