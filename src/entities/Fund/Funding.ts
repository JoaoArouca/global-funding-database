import { v4 } from 'uuid'
import { Country } from '../Country/Country'
import { Region } from '../Region/Region'
import { Organization } from '../Organization/Organization'
import { Sector } from '../Sector/Sector'
import { PartnerType } from '../PartnerType/PartnerType'
import { Technology } from '../Technology/Technology'

export class Fund {
  id: string
  title: string
  countries: Country[]
  region: Region[]
  institution: string
  program: string | null
  call: string | null
  supportType: string
  organizations: Organization[]
  sector: Sector[]
  requiresPartner: string
  partnerType: PartnerType[]
  TRLmin: string
  TRLmax: string
  technologies: Technology[]
  term: string
  objective: string | null
  elegibility: string | null
  expenses: string | null
  currency: string
  minValue: string
  maxValue: string
  supportTax: string
  duration: string
  tax: string
  shortage: string
  amortization: string
  isESG: boolean
  link: string
  status: string
  lastRelease: string
  observation: string | null

  constructor(props: Omit<Fund, 'id'>, id?: string) {
    Object.assign(this, props)

    if (!id) {
      this.id = v4()
    }
  }
}
