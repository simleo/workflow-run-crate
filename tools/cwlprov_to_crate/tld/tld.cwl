class: Workflow
cwlVersion: v1.0

inputs:
  hostnames:
    type: File
  reverse_sort:
    type: boolean
    default: false
outputs:
  tlds:
    type: File
    outputSource: sorted/sort_out

steps:
  rev1:
    in:
      rev_in: hostnames
    out: [rev_out]
    run: revtool.cwl
  cut:
    in:
      cut_in: rev1/rev_out
    out: [cut_out]
    run: cuttool.cwl
  rev2:
    in:
      rev_in: cut/cut_out
    out: [rev_out]
    run: revtool.cwl
  sorted:
    in:
      sort_in: rev2/rev_out
      reverse: reverse_sort
    out: [sort_out]
    run: sorttool.cwl
