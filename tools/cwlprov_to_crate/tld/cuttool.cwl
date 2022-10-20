class: CommandLineTool
cwlVersion: v1.0

baseCommand: cut

inputs:
  field:
    type: int?
    inputBinding:
      position: 1
      prefix: "-f"
    default: 1
  delimiter:
    type: string?
    inputBinding:
      position: 2
      prefix: "-d"
    default: "."
  cut_in:
    type: File
    inputBinding:
      position: 2
outputs:
  cut_out:
    type: stdout
stdout: cut_out.txt
