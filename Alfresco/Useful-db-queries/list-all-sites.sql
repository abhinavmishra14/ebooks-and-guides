/** Listing all existing Sites with names, descriptions and visibility **/

SELECT n.id AS "Node ID",
  n.store_id AS "Store ID",
  n.uuid AS "Site ID (UUID)",
  p.string_value AS "Site Name",
  p1.string_value AS "Site Description",
  p2.string_value AS "Site Visibility",
  n.audit_creator AS "Creator",
  n.audit_created AS "Creation Date",
  n.audit_modifier AS "Modifier",
  n.audit_modified AS "Modification Date"
FROM alf_node AS n,
  alf_node_properties AS p,
  alf_node_properties AS p1,
  alf_node_properties AS p2,
  alf_qname AS q
WHERE n.type_qname_id=q.id
  AND p.node_id=n.id
  AND p1.node_id=n.id
  AND p2.node_id=n.id
  AND p.qname_id IN (SELECT id FROM alf_qname WHERE local_name='name')
  AND p1.qname_id IN (SELECT id FROM alf_qname WHERE local_name='description')
  AND p2.qname_id IN (SELECT id FROM alf_qname WHERE local_name='siteVisibility')
  AND q.local_name='site';