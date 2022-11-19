/** 5 is for the store 'archive://SpacesStore' and 51 is for the qname 'content' **/

SELECT *
FROM alf_node
WHERE store_id=5
  AND type_qname_id=51;