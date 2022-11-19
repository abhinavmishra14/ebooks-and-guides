SELECT count(*)
FROM alf_content_data AS d,
  alf_mimetype AS m
WHERE d.content_mimetype_id=m.id
  AND m.mimetype_str='application/pdf';