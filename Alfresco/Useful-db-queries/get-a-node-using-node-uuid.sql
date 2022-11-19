SELECT n.id AS "Node ID",
  n.store_id AS "Store ID",
  round(u.content_size/1024/1024,2) AS "Size (MB)",
  n.uuid AS "Document ID (UUID)",
  n.audit_creator AS "Creator",
  n.audit_created AS "Creation Date",
  n.audit_modifier AS "Modifier",
  n.audit_modified AS "Modification Date",
  p1.string_value AS "Document Name",
  u.content_url AS "Location"
FROM alf_node AS n,
  alf_node_properties AS p,
  alf_node_properties AS p1,
  alf_namespace AS ns,
  alf_qname AS q,
  alf_content_data AS d,
  alf_content_url AS u
WHERE n.id=p.node_id
  AND ns.id=q.ns_id
  AND p.qname_id=q.id
  AND p.long_value=d.id
  AND d.content_url_id=u.id
  AND p1.node_id=n.id
  AND p1.qname_id IN (SELECT id FROM alf_qname WHERE local_name='name')
  AND n.uuid='eb267742-c018-4ba5-8ca4-75ca23c860f0';