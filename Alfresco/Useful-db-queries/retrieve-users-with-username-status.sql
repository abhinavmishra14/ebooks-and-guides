SELECT n.id,
  n.uuid,
  p1.string_value AS "Username",
  p2.boolean_value AS "Enabled",
  q.local_name AS "Type"
FROM alf_node AS n,
  alf_qname AS q,
  alf_node_properties AS p1,
  alf_node_properties AS p2
WHERE n.type_qname_id=q.id
  AND n.id=p1.node_id
  AND p1.node_id=p2.node_id
  AND p1.string_value!=''
  AND
    ((
      q.local_name='person'
      AND
      p1.qname_id IN (SELECT id FROM alf_qname WHERE local_name='userName')
    ) OR (
      q.local_name='user'
      AND
      p1.qname_id IN (SELECT id FROM alf_qname WHERE local_name='username')
    ))
  AND p2.qname_id IN (SELECT id FROM alf_qname WHERE local_name='enabled')
ORDER BY p1.string_value;