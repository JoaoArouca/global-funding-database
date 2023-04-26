import { describe, it, expect } from 'vitest'
import { Fund } from './Funding'
import { Country } from '../Country/Country'
import { Region } from '../Region/Region'
import { Organization } from '../Organization/Organization'
import { Sector } from '../Sector/Sector'
import { PartnerType } from '../PartnerType/PartnerType'
import { Technology } from '../Technology/Technology'

describe('Fund', () => {
  it('should create a new Fund object', () => {
    const countryA = new Country({ name: 'Brasil' })
    const countryB = new Country({ name: 'USA' })
    const regionA = new Region({ name: 'Region A' })
    const organizationA = new Organization({ name: 'Organization A' })
    const organizationB = new Organization({ name: 'Organization B' })
    const sectorA = new Sector({ name: 'Sector A' })
    const partnerTypeA = new PartnerType({ name: 'Partner Type A' })
    const technologyA = new Technology({ name: 'Technology A' })
    const technologyB = new Technology({ name: 'Technology B' })

    const fund = new Fund({
      title: 'Test Fund',
      countries: [countryA, countryB],
      region: [regionA],
      institution: 'Test Institution',
      program: 'Test Program',
      call: 'Test Call',
      supportType: 'Test Support Type',
      organizations: [organizationA, organizationB],
      sector: [sectorA],
      requiresPartner: 'Test Partner Requirement',
      partnerType: [partnerTypeA],
      TRLmin: 'Test TRL Min',
      TRLmax: 'Test TRL Max',
      technologies: [technologyA, technologyB],
      term: 'Test Term',
      objective: 'Test Objective',
      elegibility: 'Test Elegibility',
      expenses: 'Test Expenses',
      currency: 'Test Currency',
      minValue: 'Test Min Value',
      maxValue: 'Test Max Value',
      supportTax: 'Test Support Tax',
      duration: 'Test Duration',
      tax: 'Test Tax',
      shortage: 'Test Shortage',
      amortization: 'Test Amortization',
      isESG: true,
      link: 'Test Link',
      status: 'Test Status',
      lastRelease: 'Test Last Release',
      observation: 'Test Observation',
    })

    expect(fund.title).toEqual('Test Fund')
    expect(fund.countries).toEqual([countryA, countryB])
    expect(fund.region).toEqual([regionA])
    expect(fund.institution).toEqual('Test Institution')
    expect(fund.program).toEqual('Test Program')
    expect(fund.call).toEqual('Test Call')
    expect(fund.supportType).toEqual('Test Support Type')
    expect(fund.organizations).toEqual([organizationA, organizationB])
    expect(fund.sector).toEqual([sectorA])
    expect(fund.requiresPartner).toEqual('Test Partner Requirement')
    expect(fund.partnerType).toEqual([partnerTypeA])
    expect(fund.TRLmin).toEqual('Test TRL Min')
    expect(fund.TRLmax).toEqual('Test TRL Max')
  })
})
