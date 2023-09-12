select
   n.uuid as uid,
   np2.string_value as name,
   cu.content_size as size,
   ns1.uri as typeNamesüace,
   qn1.local_name as typeName,
   ns2.uri as propertyNamespace,
   qn2.local_name as propertyName
from
   alf_node_properties np1
   left join alf_node n on n.id = np1.node_id
   left join alf_node_properties np2 on np2.node_Id = np1.node_id
   left join alf_qname qn1 on qn1.id = n.type_qname_id
   left join alf_namespace ns1 on ns1.id = qn1.ns_id
   left join alf_qname qn2 on qn2.id = np1.qname_id
   left join alf_namespace ns2 on ns2.id = qn2.ns_id
   left join alf_qname qn3 on qn3.id = np2.qname_id
   left join alf_namespace ns3 on ns3.id = qn3.ns_id
   left join alf_content_data cd on cd.id = np1.long_value
   left join alf_content_url cu on cu.id = cd.content_url_id
where
   qn3.local_name = 'name'
   and ns3.uri = 'http://www.alfresco.org/model/content/1.0'
   and np1.actual_type_n = 21;