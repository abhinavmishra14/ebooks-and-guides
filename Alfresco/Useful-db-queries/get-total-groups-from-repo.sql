SELECT count(*)
FROM alf_node AS n,
  alf_qname AS q
WHERE n.type_qname_id=q.id
  AND q.local_name='authorityContainer';