UPDATE alf_node_properties
  SET boolean_value=false
WHERE node_id IN (SELECT n1.id
    FROM alf_node AS n1,
      alf_node_properties AS p1
    WHERE n1.type_qname_id IN (SELECT q1.id FROM alf_qname AS q1 WHERE q1.local_name='user')
      AND n1.id=p1.node_id
      AND p1.qname_id IN (SELECT q2.id FROM alf_qname AS q2 WHERE q2.local_name='username')
      AND p1.string_value NOT IN ('admin'))
 AND qname_id IN (SELECT q3.id
    FROM alf_qname AS q3
    WHERE q3.local_name='enabled');