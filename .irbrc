IRB.conf[:PROMPT][:ZENDESK] = IRB.conf[:PROMPT][:SIMPLE]
IRB.conf[:PROMPT][:ZENDESK][:PROMPT_I] = 'zendesk> '
IRB.conf[:PROMPT_MODE] = :ZENDESK
IRB.conf[:SAVE_HISTORY] = 1000