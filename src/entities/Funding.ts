import { v4 } from 'uuid'

export class Fund {
  id: string
  title: string
  countries: string[]
  region: string[]
  institution: string
  program: string
  call: string | null
  supportType: string
  organizations: string[]
  sector: string[]
  requiresPartner: boolean | null
  partnerType: string[]
  TRLmin: string
  TRLmax: string
  term: string
  objective: string
  elegibility: string
  expenses: string
  minValueReembolsaveis: string
  maxValueReembolsaveis: string
  minValueSubvencao: string
  maxValueSubvencao: string
  supportTax: string
  duration: string
  tax: string
  shortage: string
  amortization: string
  isESG: boolean
  link: string
  status: string
  technologies: string[]
  lastRelease: string

  constructor(props: Omit<Fund, 'id'>, id?: string) {
    Object.assign(this, props)

    if (!id) {
      this.id = v4()
    }
  }
}
