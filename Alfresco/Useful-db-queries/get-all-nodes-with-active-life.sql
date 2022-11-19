/** 6 is for the store 'workspace://SpacesStore' and 51 is for the qname 'content' **/

SELECT *
FROM alf_node
WHERE store_id=6
  AND type_qname_id=51;