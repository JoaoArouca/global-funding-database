import { Fund } from '../../entities/Fund/Funding'

export interface IFundRepository {
  findByTitle(title: string): Promise<Fund>
  save(fund: Fund): Promise<void>
}
