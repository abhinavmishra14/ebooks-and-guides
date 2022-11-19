/** All Nodes that have been removed from the global trashcan and that are now orphaned **/
SELECT *
FROM alf_content_url
WHERE orphan_time IS NOT NULL;