import { Fund } from '../../entities/Fund/Funding'
import { IFundRepository } from '../../repositories/Fund/FundRepository'
import { ICreateFundRequestDTO } from './CreateFundDTO'

export class CreateFomento {
  constructor(private fundRepository: IFundRepository) {}

  async execute(data: ICreateFundRequestDTO) {
    const fundAlreadyExists = await this.fundRepository.findByTitle(data.title)

    if (fundAlreadyExists) {
      throw new Error('Fund already exists')
    }

    const fomento = new Fund(data)

    await this.fundRepository.save(fomento)

    return fomento
  }
}
