/** Size and number of documents created by all users**/

SELECT n.audit_creator AS "Creator",
  round(sum(s.bin_size)/1024/1024,2) AS "Total Size (MB)",
  count(*) AS "Nb Document"
FROM alf_node AS n,
  alf_qname AS q,
  (SELECT n1.id AS "id",
     u1.content_size AS "bin_size"
   FROM alf_node AS n1,
     alf_node_properties AS p1,
     alf_content_data AS d1,
     alf_content_url AS u1
   WHERE n1.id=p1.node_id
     AND p1.long_value=d1.id
     AND d1.content_url_id=u1.id
     AND p1.qname_id=(SELECT id FROM alf_qname WHERE local_name='content')) AS s
WHERE n.type_qname_id=q.id
  AND n.id=s.id
  AND q.local_name='content'
GROUP BY n.audit_creator
ORDER BY sum(s.bin_size) DESC;