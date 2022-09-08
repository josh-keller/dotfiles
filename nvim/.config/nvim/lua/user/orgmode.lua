require('orgmode').setup_ts_grammar()

require('orgmode').setup({
  org_agenda_files = {'~/notes/org/*'},
  org_default_notes_file = '~/notes/org/refile.org',
  org_capture_templates = {
    j = {
      description = 'Journal',
      template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
      target = '~/notes/org/journal.org'
    }
  },
})
