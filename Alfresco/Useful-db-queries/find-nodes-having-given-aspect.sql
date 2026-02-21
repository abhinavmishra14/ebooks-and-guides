SELECT n.id AS node_id, n.uuid, n.type_qname_id, q.local_name AS type_name
FROM alf_node n
JOIN alf_node_aspects na ON n.id = na.node_id
JOIN alf_qname q ON n.type_qname_id = q.id
JOIN alf_qname aspect_q ON na.qname_id = aspect_q.id
WHERE aspect_q.local_name = 'myDemoMetadataAspect'
AND aspect_q.ns_id = (SELECT id FROM alf_namespace WHERE uri = 'http://www.example.demo.com/model/content/1.0');