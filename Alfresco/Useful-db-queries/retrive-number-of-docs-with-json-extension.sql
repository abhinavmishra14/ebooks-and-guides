SELECT count(*)
FROM alf_node AS n,
  alf_qname AS q,
  alf_node_properties AS p
WHERE n.type_qname_id=q.id
  AND p.node_id=n.id
  AND p.qname_id IN (SELECT id FROM alf_qname WHERE local_name='name')
  AND q.local_name='content'
  AND p.string_value LIKE '%.json';