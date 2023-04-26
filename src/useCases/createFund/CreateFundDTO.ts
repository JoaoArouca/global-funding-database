import { Country } from '../../entities/Country/Country'
import { Region } from '../../entities/Region/Region'
import { Organization } from '../../entities/Organization/Organization'
import { Sector } from '../../entities/Sector/Sector'
import { PartnerType } from '../../entities/PartnerType/PartnerType'
import { Technology } from '../../entities/Technology/Technology'

export interface ICreateFundRequestDTO {
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
}
