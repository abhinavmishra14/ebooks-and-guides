var searchString = "/sys:system-registry/module:modules/*"; // XPath search string
var store = "system://system";
var nodes = search.selectNodes(store, searchString);

for each (var node in nodes) {
  if(node.name=="an-alfresco-platform-jar-module") {
    logger.log("Removing the module: " + node.name);
    node.addAspect("sys:temporary");
    node.remove();
  }
}
